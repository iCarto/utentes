#!/bin/bash

set -x
. ./variables.ini

explotaciones_no_existentes=`$PSQL -t -X -A $PG_CONNECTION -c "
select count(*) from public.${TABLE_EXPLORACAOS_TMP} tmp
	left join utentes.exploracaos expl on tmp.e_exp_id = expl.exp_id and tmp.e_exp_name = expl.exp_name
where expl.gid is null
"`
if [ $explotaciones_no_existentes -ne 0 ]; then
    echo "Explotaciones no existentes en BBDD: ${explotaciones_no_existentes}"
    exit 1
fi

$PSQL $PG_CONNECTION -c "
UPDATE utentes.exploracaos exp
SET
    the_geom = ST_Multi(tmp.geom),
    area = ST_Area(tmp.geom) / 10000
FROM public.${TABLE_EXPLORACAOS_TMP} tmp
WHERE exp.exp_id = tmp.e_exp_id
"

$PSQL $PG_CONNECTION -c "
CREATE OR REPLACE FUNCTION fn_get_exp_id(cultivo_id VARCHAR(200)) RETURNS VARCHAR(200)
AS \$\$ select split_part(cultivo_id, '/', 1) || '/' || split_part(cultivo_id, '/', 2) || '/' || split_part(cultivo_id, '/', 3); \$\$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fn_get_cult_id(cultivo_id VARCHAR(200)) RETURNS VARCHAR(200)
AS \$\$ select regexp_replace(cultivo_id, '^.*/', ''); \$\$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fn_get_exploracao_id(p_exploracao_id VARCHAR(200)) RETURNS INTEGER
AS \$\$ select gid from utentes.exploracaos where exp_id = p_exploracao_id; \$\$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fn_get_actividade_id(p_exploracao INTEGER) RETURNS INTEGER
AS \$\$ select gid from utentes.actividades where exploracao = p_exploracao; \$\$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fn_get_eficiencia(p_rega TEXT) RETURNS NUMERIC(10,2)
AS \$\$ select CASE COALESCE(p_rega, 'Aspersão') WHEN 'Aspersão' THEN 0.76 WHEN 'Gota a gota' THEN 0.85 WHEN 'Gravidade' THEN 0.62 WHEN 'Regional' THEN NULL ELSE NULL END as eficiencia; \$\$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fn_get_c_estimado(p_rega TEXT, p_area double precision, p_eficiencia double precision) RETURNS DOUBLE PRECISION
AS \$\$ select COALESCE(
           CASE p_rega
               WHEN 'Regional' THEN p_area * 10000 / 12
               ELSE (p_area * 30 * 86400 * 0.21) / (1000 * p_eficiencia)
           END,
           0)
       as c_estimado; \$\$
LANGUAGE SQL;

-- actualizar la tabla de cultivos con los datos del shp
INSERT INTO utentes.actividades_cultivos as ac (
    cult_id,
    actividade,
    cultivo,
    rega,
    eficiencia,
    area,
    c_estimado,
    observacio,
    the_geom
)
SELECT
    cult_id,
    fn_get_actividade_id(fn_get_exploracao_id(fn_get_exp_id(cult_id))),
    cultivo,
    rega,
    fn_get_eficiencia(rega),
    ST_Area(geom) / 10000,
    fn_get_c_estimado(rega, (ST_Area(geom) / 10000), fn_get_eficiencia(rega)),
    observacio,
    ST_Multi(geom)
FROM public.${TABLE_CULTIVOS_TMP}
ON CONFLICT (cult_id)
DO UPDATE SET
    the_geom = ST_Multi(Excluded.the_geom),
    rega = Excluded.rega,
    eficiencia = fn_get_eficiencia(Excluded.rega),
    area = ST_Area(Excluded.the_geom) / 10000,
    c_estimado = fn_get_c_estimado(Excluded.rega, (ST_Area(Excluded.the_geom) / 10000), fn_get_eficiencia(Excluded.rega));

-- modificar los datos agregados en actividades_agricultura_rega
WITH actividades_in_shp AS (
    SELECT a.gid FROM utentes.actividades a LEFT JOIN utentes.exploracaos e on e.gid = a.exploracao WHERE e.exp_id in (SELECT tmp.e_exp_id FROM public.${TABLE_EXPLORACAOS_TMP} tmp)
)
UPDATE utentes.actividades_agricultura_rega a SET
	n_cul_tot = (SELECT count(*) FROM utentes.actividades_cultivos c WHERE c.actividade = a.gid),
	c_estimado = (SELECT COALESCE(sum(c_estimado), 0) FROM utentes.actividades_cultivos c WHERE c.actividade = a.gid),
	area_medi = (SELECT COALESCE(sum(area), 0) FROM utentes.actividades_cultivos c WHERE c.actividade = a.gid)
WHERE a.gid IN(select act.gid FROM actividades_in_shp act);

-- modificar el c_estimado de la explotación
WITH actividades_in_shp AS (
    SELECT a.gid as actividade_id, e.gid as exploracao_id, aar.c_estimado FROM utentes.actividades a
    	LEFT JOIN utentes.actividades_agricultura_rega aar on aar.gid = a.gid
    	LEFT JOIN utentes.exploracaos e on e.gid = a.exploracao WHERE e.exp_id in (SELECT tmp.e_exp_id FROM public.${TABLE_EXPLORACAOS_TMP} tmp)
)
UPDATE utentes.exploracaos e SET
	c_estimado = ais.c_estimado
FROM
	actividades_in_shp ais where e.gid = ais.exploracao_id;

DROP FUNCTION fn_get_exp_id(VARCHAR(200));
DROP FUNCTION fn_get_cult_id(VARCHAR(200));
DROP FUNCTION fn_get_exploracao_id(VARCHAR(200));
DROP FUNCTION fn_get_actividade_id(INTEGER);
DROP FUNCTION fn_get_eficiencia(TEXT);
DROP FUNCTION fn_get_c_estimado(TEXT, double precision, double precision);

DROP TABLE public.${TABLE_EXPLORACAOS_TMP};
DROP TABLE public.${TABLE_CULTIVOS_TMP};
"
