#!/bin/bash

set -e
source ../server/variables.ini
source db_utils.sh
source upload_utentes_functions.sh

SHP="${1}"
BASE_SPREADSHEET="${2}"
DATABASE="${3}"
METADATA_FILE="${4}"
CULTIVOS_SHP="${5}"

# REVIEW IN EACH PROCESS
# FILTER_UTENTES_FROM_EXCEL="DELETE FROM tmp_utentes WHERE estado NOT IN ('Utente de usos comuns') AND nome != 'Miniarte, Lda';"
# UTENTES_TO_EXCLUDE_AND_DROP="WHERE nome NOT IN ('Ncondezi Coal Company', 'Hidroeléctrica de Cahora Bassa - Songo', 'Ouça Moçambique (Espanhois)', 'JSPL Mozambique Minerais, Lda (Jindal)', 'Episteme Moç, Lda', 'Al Bustan Farms Lda', 'Hoyo-Hoyo', 'ENRC Mozambique, Lda') -- gestionado aparte"

IETL_REPO="${HOME}/development/ietl/ietl"
PG_CONNECTION="-h localhost -p $PG_PORT -d ${DATABASE} -U postgres"

WARNINGS_FILE="${TODAY}_warnings_file.txt"
echo "" > "${WARNINGS_FILE}"

# TODO in the cli
# source ../server/variables.ini
# workon utentes-bd
# source bddunica.sh
# update_200423_arac

# El gid de la última explotación antes de arrancar este proceso cuando se
# estén mezclando con existentes.
LAST_EXP_GID=$($PSQL $PG_CONNECTION -c "SELECT COALESCE(max(gid), 0) FROM utentes.exploracaos")
LAST_UT_GID=$($PSQL $PG_CONNECTION -c "SELECT COALESCE(max(gid), 0) FROM utentes.utentes")

printf 'Último exp-gid existente: %s. Último ute-gid existente %s\n' "${LAST_EXP_GID}" "${LAST_UT_GID}"

python prepare_data.py "${BASE_SPREADSHEET}" "${DATABASE}" "${METADATA_FILE}" "${LAST_EXP_GID}" --shp "${SHP}"

FOLDER="$(dirname "$SHP")/output"
rm -rf "${FOLDER}"
mkdir -p "${FOLDER}"
cp "${BASE_SPREADSHEET}" "${FOLDER}"
BASE_SPREADSHEET="${FOLDER}/$(basename "${BASE_SPREADSHEET}")"
XLSX="${FOLDER}/working.ods"
METADATA_FOLDER=$(dirname ${METADATA_FILE})

# TODO. Always check if --ignore_header is what you want
# python "${IETL_REPO}/sanitize_spreadsheet.py" --bdd "${BASE_SPREADSHEET}" --metadata "${METADATA_FILE}" --ignore_header
python "${IETL_REPO}/sanitize_spreadsheet.py" --bdd "${BASE_SPREADSHEET}" --metadata "${METADATA_FILE}"

ogr2ogr -f "ESRI Shapefile" "${FOLDER}/dbfs" "$XLSX" -lco ENCODING=UTF-8 --config OGR_ODS_HEADERS FORCE

upload "$SHP" "public.exploracaos_geoms"
upload "$CULTIVOS_SHP" "public.cultivos_geoms"
upload "${FOLDER}/dbfs/Fontes.dbf" "public.tmp_fontes"
upload "${FOLDER}/dbfs/Cultivos.dbf" "public.tmp_cultivos" # uten_n; id_exp; lic_n; tipo; tipo_rega; area; observacio
upload "${FOLDER}/dbfs/Utentes.dbf" "public.tmp_utentes"
upload "${FOLDER}/dbfs/Reses.dbf" "public.tmp_reses" # uten_n; id_exp; lic_n; tipo_res; n_reses

if [ -n "${FILTER_UTENTES_FROM_EXCEL}" ]; then
    echo "Filtrando utentes: ${FILTER_UTENTES_FROM_EXCEL}"
    $PSQL $PG_CONNECTION -c "${FILTER_UTENTES_FROM_EXCEL}"
fi

rename_and_create_columns
fix_field_types

UTENTES_DUPLICADOS=$($PSQL $PG_CONNECTION -c "
    -- DETECTAR UTENTES CON MISMO NOMBRE Y DISTINTOS DATOS
    WITH foo AS (
        SELECT nome
        FROM tmp_utentes
        GROUP BY nome, uten_tipo, nuit, uten_gere, loc_provin, loc_distri, loc_posto, loc_nucleo, contacto, telefone, email, reg_comerc, reg_zona, loc_endere
    ) SELECT nome, count(*) FROM foo GROUP BY nome HAVING count(*) > 1 ORDER BY 2, 1 ;
")
if [[ -n "${UTENTES_DUPLICADOS}" ]]; then
    echo -e "\nERROR: Hay utentes duplicados"
    echo "${UTENTES_DUPLICADOS}"
    exit 1
fi

EXP_ID_DUPLICADOS_A=$($PSQL $PG_CONNECTION -c "
    select exp_id, count(*) from tmp_utentes group by exp_id having count(*) > 1 order by 2 asc, 1;
")
EXP_ID_DUPLICADOS_B=$($PSQL $PG_CONNECTION -c "
WITH foo AS (
    SELECT exp_id, count(*)
    FROM tmp_utentes
    GROUP BY
        nome, uten_tipo, nuit, uten_gere, contacto, telefone, email, loc_provin, loc_distri, loc_posto, loc_nucleo, loc_endere, reg_comerc, reg_zona
        , exp_id, exp_name, d_soli, pago_lice, observacio, loc_prov_1, loc_dist_1, loc_posto2, loc_nucl_1, loc_ende_1, loc_unidad, loc_bacia, loc_subaci, loc_rio
        , tipo, habitantes, area_pot, area_irri, area_medi, tipo_indus, eval_impac, instalacio, energia_tipo, potencia
        , estado
        , fact_tipo, cadastro
) SELECT exp_id, count FROM foo WHERE count > 1 ORDER BY 2 asc, 1 ;
")

if [[ -n "${EXP_ID_DUPLICADOS_A}" ]]; then
    echo -e "\nERROR: Hay EXP_ID duplicados. Los que estén en la segunda lista y a pesar de estar en la primera seguramente están bien. Es que tienen dos licencias"
    echo "Primera lista"
    echo "${EXP_ID_DUPLICADOS_A}"
    echo "Segunda lista"
    echo "${EXP_ID_DUPLICADOS_B}"
    # exit 1
fi

# Igual habría que usar "enlace" en lugar de "exp_id"
EXP_ID_DUPLICADOS=$($PSQL $PG_CONNECTION -c "
    select exp_id from exploracaos_geoms group by exp_id having count(*) > 1;
")
if [[ -n "${EXP_ID_DUPLICADOS}" ]]; then
    echo -e "\nERROR: Hay EXP_ID duplicados en exploracaos_geoms"
    echo "${EXP_ID_DUPLICADOS}"
    exit 1
fi

CULT_ID_DUPLICADOS=$($PSQL $PG_CONNECTION -c "
    select cult_id from tmp_cultivos group by cult_id having count(*) > 1;
")
if [[ -n "${CULT_ID_DUPLICADOS}" ]]; then
    echo -e "\nERROR: Hay cult_id duplicados en tmp_cultivos"
    echo "${CULT_ID_DUPLICADOS}"
    exit 1
fi

CULT_ID_DUPLICADOS=$($PSQL $PG_CONNECTION -c "
    select cult_id from cultivos_geoms group by cult_id having count(*) > 1;
")
if [[ -n "${CULT_ID_DUPLICADOS}" ]]; then
    echo -e "\nERROR: Hay cult_id duplicados en cultivos_geoms"
    echo "${CULT_ID_DUPLICADOS}"
    exit 1
fi

HAY_PECUARIA=$($PSQL $PG_CONNECTION -c "select 1 from tmp_utentes WHERE tipo ilike '%pecu%' limit 1;")
if [[ -n "${HAY_PECUARIA}" ]]; then
    echo -e "\nHay Agro-Pecuaria o Pecuaria hay que gestionar las reses"
    echo "Aún así continuamos"
    # exit 1
fi

# workaround_clear_utente_loc_fields_for_testing_purposes
# fix_domains_fuzzy

source ${METADATA_FOLDER}/workarounds.sh
workaround_before_handling_domains
set_default_domains
fix_domains
fix_other_domains
check_bad_domains

N_GEOMS_ENLAZAN=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM tmp_utentes a FULL OUTER JOIN exploracaos_geoms b ON a.enlace = b.enlace WHERE a.gid IS NOT NULL AND b.gid IS NOT NULL;")
N_GEOMS_TOTALES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM exploracaos_geoms;")
N_EXPS_TOTALES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM tmp_utentes;")
printf '
Número de geometrías que enlazan: %s
Número de geometrías totales: %s
Número de explotaciones totales: %s

' "${N_GEOMS_ENLAZAN}" "${N_GEOMS_TOTALES}" "${N_EXPS_TOTALES}"

# Geometrías que no enlazan por nombre. No pasa nada. SELECT a.gid, a.enlace, a.exp_name, b.gid, b.enlace, b.nome FROM tmp_utentes a FULL OUTER JOIN exploracaos_geoms b ON a.exp_name = b.nome WHERE a.gid IS NULL;

# Geometrías que no enlazan por "enlace". No debería pasar nunca pero puede pasar. Si el shape a sabiendas tiene geometrías que no se corresponden con las explotaciones.
ENLACE_GEOM_MAL=$($PSQL $PG_CONNECTION -c "SELECT a.gid, a.enlace, a.exp_name, b.gid, b.enlace, b.exp_name FROM tmp_utentes a FULL OUTER JOIN exploracaos_geoms b ON a.enlace = b.enlace WHERE a.gid IS NULL;")
if [[ -n "${ENLACE_GEOM_MAL}" ]]; then
    echo -e "\nHay geometrías que no están enlazando"
    echo -e "${ENLACE_GEOM_MAL}"
    exit 1
fi

$PSQL $PG_CONNECTION -c "
UPDATE tmp_utentes a SET geom = ST_Transform(b.geom, 32737) FROM exploracaos_geoms b where a.enlace = b.enlace;
"

# GEOMETRÍAS CULTIVOS
N_GEOMS_ENLAZAN=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM tmp_cultivos a FULL OUTER JOIN cultivos_geoms b ON a.cult_id = b.cult_id WHERE a.gid IS NOT NULL AND b.gid IS NOT NULL;")
N_GEOMS_TOTALES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM cultivos_geoms;")
N_EXPS_TOTALES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM tmp_cultivos;")
printf '
Cultivos. Si hay más geometrías enlazando que totales, hay algún problema. Si es al revés no.
Número de geometrías que enlazan: %s
Número de geometrías totales: %s
Número de explotaciones totales: %s

' "${N_GEOMS_ENLAZAN}" "${N_GEOMS_TOTALES}" "${N_EXPS_TOTALES}"

# Geometrías de cultivos que no enlazan
unset ENLACE_GEOM_MAL
ENLACE_GEOM_MAL=$($PSQL $PG_CONNECTION -c "SELECT a.gid, a.enlace, a.cult_id, b.gid, b.enlace, b.cult_id FROM tmp_cultivos a FULL OUTER JOIN cultivos_geoms b ON a.cult_id = b.cult_id WHERE a.gid IS NULL;")
if [[ -n "${ENLACE_GEOM_MAL}" ]]; then
    echo -e "\nHay geometrías que no están enlazando"
    echo -e "${ENLACE_GEOM_MAL}"
    exit 1
fi
$PSQL $PG_CONNECTION -c "
UPDATE tmp_cultivos a SET geom = ST_Transform(b.geom, 32737) FROM cultivos_geoms b where a.cult_id = b.cult_id;
"

# TODO. En caso de que no se proporcioara un excel de cultivos, en este paso se podrí
#       rellenar tmp_utentes a partir de cultivos_geoms

echo "FALTA ACORDAR UN MÉTODO DE GESTIONAR LOS CULTIVOS. CUIDADO CON ESTO"
N_CULTIVOS_ANTES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM utentes.actividades_cultivos;")
N_EXPS_ANTES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM utentes.exploracaos;")
N_LICS_ANTES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM utentes.licencias;")
N_FONTES_ANTES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM utentes.fontes;")

# Recordatorio, no se puede usar -c "" con especifidades de psql, es decir no se puede
# substituir ${LAST_EXP_GID} por :last_exp_gid
! read -d '' main_sql << EOF

-- CONVERTIR EN UPSERT PARA QUE AL MENOS CUANDO LOS DATOS SEAN IGUALES NO DE PROBLEMAS
INSERT INTO utentes.utentes
(nome, uten_tipo, nuit, uten_gere, loc_provin, loc_distri, loc_posto, loc_nucleo, contacto, telefone, email, reg_comerc, reg_zona, loc_endere)
SELECT
nome, uten_tipo, nuit, uten_gere, loc_provin, loc_distri, loc_posto, loc_nucleo, contacto, telefone, email, reg_comerc, reg_zona, loc_endere
FROM tmp_utentes
${UTENTES_TO_EXCLUDE_AND_DROP}
GROUP BY
nome, uten_tipo, nuit, uten_gere, loc_provin, loc_distri, loc_posto, loc_nucleo, contacto, telefone, email, reg_comerc, reg_zona, loc_endere
;


-- El group by ya está pensando para que funcione con varias licencias por
-- explotación
INSERT INTO utentes.exploracaos
(exp_id, exp_name, d_soli, pago_lic, observacio, loc_provin, loc_distri, loc_posto, loc_nucleo, loc_endere, loc_unidad, loc_bacia, loc_subaci, loc_rio, the_geom, utente, area, estado_lic, fact_tipo, cadastro_uni)
SELECT
    exp_id, exp_name, d_soli, pago_lice, observacio, loc_prov_1, loc_dist_1, loc_posto2, loc_nucl_1, loc_ende_1, loc_unidad, loc_bacia, loc_subaci, loc_rio, geom
    , (select gid from utentes.utentes u where u.nome = t.nome)
    , ST_Area(geom) / 10000, estado
    , fact_tipo
    , t.cadastro
FROM tmp_utentes t
GROUP BY
exp_id, exp_name, d_soli, pago_lice, observacio, loc_prov_1, loc_dist_1, loc_posto2, loc_nucl_1, loc_ende_1, loc_unidad, loc_bacia, loc_subaci, loc_rio, geom, (select gid from utentes.utentes u where u.nome = t.nome) , ST_Area(geom) / 10000, estado, fact_tipo, cadastro
;



-- Cojo las que tienen tipo, y también aquellas que es obligatorio que lo tengan para que se produzca un error si no lo tienen.
WITH foo AS (
    SELECT exp_id, tipo
    FROM tmp_utentes
    WHERE
        tipo IS NOT NULL
        OR
        estado IN ( SELECT key from domains.licencia_estado WHERE parent IN ('postcampo', 'post-licenciada') )
    GROUP BY exp_id, tipo
)
INSERT INTO utentes.actividades (exploracao, tipo) SELECT (SELECT e.gid FROM utentes.exploracaos e WHERE e.exp_id = foo.exp_id), tipo FROM foo;



WITH tmp AS (
   SELECT
       c.gid as actividad, a.exp_id, c.exploracao, habitantes
   FROM tmp_utentes a JOIN utentes.exploracaos b ON a.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
   WHERE a.tipo = 'Abastecimento'
   GROUP BY
       c.gid             , a.exp_id, c.exploracao, habitantes
)
INSERT INTO utentes.actividades_abastecemento (gid, habitantes, c_estimado, dotacao) SELECT actividad, habitantes, habitantes * 20 * 30 / 1000, 20 FROM tmp;


WITH tmp AS (
   SELECT
       c.gid as actividad, a.exp_id, c.exploracao, tipo_indus, eval_impac, instalacio
   FROM tmp_utentes a JOIN utentes.exploracaos b ON a.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
   WHERE a.tipo = 'Indústria'
   GROUP BY
       c.gid             , a.exp_id, c.exploracao, tipo_indus, eval_impac, instalacio
)
INSERT INTO utentes.actividades_industria (gid, tipo_indus, eval_impac, instalacio) SELECT actividad, tipo_indus, eval_impac, instalacio FROM tmp;


WITH tmp AS (
   SELECT
       c.gid as actividad, a.exp_id, c.exploracao, eval_impac, a.energia_tipo, a.potencia
   FROM tmp_utentes a JOIN utentes.exploracaos b ON a.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
   WHERE a.tipo = 'Producção de energia'
   GROUP BY
       c.gid             , a.exp_id, c.exploracao, eval_impac, a.energia_tipo, a.potencia
)
INSERT INTO utentes.actividades_produccao_energia
    (gid, eval_impac, energia_tipo, potencia)
SELECT actividad, eval_impac, energia_tipo, potencia
FROM tmp;

WITH tmp AS (
   SELECT
       c.gid as actividad, a.exp_id, c.exploracao
   FROM tmp_utentes a JOIN utentes.exploracaos b ON a.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
   WHERE a.tipo = 'Piscicultura'
   GROUP BY
       c.gid             , a.exp_id, c.exploracao
)
INSERT INTO utentes.actividades_piscicultura
    (gid)
SELECT actividad
FROM tmp;


WITH tmp AS (
   SELECT c.gid as actividad, a.exp_id, c.exploracao
   FROM tmp_utentes a JOIN utentes.exploracaos b ON a.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
   WHERE a.tipo = 'Pecuária'
   GROUP BY
         c.gid              , a.exp_id, c.exploracao
)
INSERT INTO utentes.actividades_pecuaria (gid) SELECT actividad FROM tmp;


WITH tmp AS (
   SELECT
       c.gid as actividad, a.exp_id, c.exploracao, area_pot, area_irri, area_medi
   FROM tmp_utentes a JOIN utentes.exploracaos b ON a.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
   WHERE a.tipo = 'Agricultura de Regadio'
   GROUP BY
       c.gid             , a.exp_id, c.exploracao, area_pot, area_irri, area_medi

)
INSERT INTO utentes.actividades_agricultura_rega (gid, area_pot, area_irri, area_medi) SELECT actividad, area_pot, area_irri, area_medi FROM tmp;

-- Para tmp_cultivos
WITH tmp AS (
    SELECT
        a.enlace,
        c.gid as actividade,
        b.exp_id as exp_id,
        a.cult_id,
        a.cultivo,
        a.rega,
        CASE a.rega WHEN 'Aspersão' THEN 0.76 WHEN 'Gota a gota' THEN 0.85 WHEN 'Gravidade' THEN 0.62 WHEN 'Regional' THEN NULL ELSE NULL END as eficiencia,
        a.area,
        a.observacio,
        a.geom,
        row_number() OVER (PARTITION BY a.enlace)
        FROM tmp_cultivos a JOIN (SELECT exp_id, enlace FROM tmp_utentes GROUP BY exp_id, enlace) u ON a.enlace = u.enlace JOIN utentes.exploracaos b ON u.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
        ORDER BY a.enlace
)
INSERT INTO utentes.actividades_cultivos(actividade, cult_id, c_estimado, cultivo, rega, eficiencia, area, observacio, the_geom)
SELECT
       actividade
       -- , exp_id || '/' || trim(to_char(row_number, '000'))
       , cult_id
       , COALESCE(
           CASE rega
               WHEN 'Regional' THEN area * 10000 / 12
               ELSE (area * 30 * 86400 * 0.21) / (1000 * eficiencia)
           END,
           0
       )
       , cultivo
       , rega
       , eficiencia
       , area
       , observacio
       , geom
FROM tmp;



UPDATE utentes.actividades_agricultura_rega a SET n_cul_tot = (SELECT count(*) FROM utentes.actividades_cultivos c WHERE c.actividade = a.gid); -- no editable por usuario
UPDATE utentes.actividades_agricultura_rega a SET c_estimado = (SELECT sum(c_estimado) FROM utentes.actividades_cultivos c WHERE c.actividade = a.gid); -- no editable por usuario
UPDATE utentes.actividades_agricultura_rega a SET area_medi = (SELECT sum(area) FROM utentes.actividades_cultivos c WHERE c.actividade = a.gid) WHERE area_medi IS NULL; -- editable, pero tiene sentido sin filtrado extra


WITH actv AS (
    SELECT gid as actividad, c_estimado FROM utentes.actividades_abastecemento
    UNION
    SELECT gid as actividad, c_estimado FROM utentes.actividades_agricultura_rega
    UNION
    SELECT gid as actividad, c_estimado FROM utentes.actividades_industria
    UNION
    SELECT gid as actividad, c_estimado FROM utentes.actividades_pecuaria
    UNION
    SELECT gid as actividad, c_estimado FROM utentes.actividades_piscicultura
    UNION
    SELECT gid as actividad, c_estimado FROM utentes.actividades_produccao_energia
    UNION
    SELECT gid as actividad, c_estimado FROM utentes.actividades_saneamento
), actv_exp AS (
    SELECT a.actividad, a.c_estimado, b.exploracao FROM actv a JOIN utentes.actividades b ON a.actividad = b.gid
)
UPDATE utentes.exploracaos e SET
    c_estimado = actv_exp.c_estimado
FROM actv_exp
WHERE
    e.gid = actv_exp.exploracao
    AND e.gid > ${LAST_EXP_GID};


-- Según como enlace esto, por enlace, por exp_id, por todo, hay que ajustar
-- la query de INSERT INTO fontes y la query de utentes_sin_fontes
/*
WITH
    match AS (
        SELECT t.enlace, t.exp_id, t.exp_name
        FROM
            tmp_fontes t
            JOIN
            (SELECT enlace, exp_id, exp_name FROM tmp_utentes GROUP BY enlace, exp_id, exp_name) u
            ON t.enlace = u.enlace AND t.exp_id = u.exp_id AND t.exp_name = u.exp_name
    )
    , contaje1 AS (

        SELECT count(*) FROM match
    )
    , contaje2 AS (
        SELECT count(*) FROM tmp_fontes
    )
SELECT CASE WHEN (SELECT count(*) FROM match) = (SELECT count(*) FROM tmp_fontes) THEN 1 ELSE (SELECT 1)/0 END;
;
*/
-- No deshacer el join con tmp_utentes porque permite filtrar los que se hayan
-- eliminado del excel original
INSERT INTO utentes.fontes
    (tipo_agua, tipo_fonte, d_dado, sist_med, c_real, c_soli, lat_lon, observacio
    , exploracao)
SELECT
    t.tipo_agua, t.tipo_fonte, t.d_dado, t.sist_med, t.c_real, t.c_soli, t.lat_lon, t.observacio
    , e.gid
    -- , t.enlace
FROM
    tmp_fontes t
    JOIN
    (SELECT enlace, exp_id, exp_name FROM tmp_utentes GROUP BY enlace, exp_id, exp_name) u
    ON t.enlace = u.enlace AND t.exp_id = u.exp_id AND t.exp_name = u.exp_name
    -- ON t.exp_id = u.exp_id
    JOIN utentes.exploracaos e ON u.exp_id = e.exp_id;


ALTER TABLE tmp_utentes ADD COLUMN c_real_int numeric(10,2);
ALTER TABLE tmp_utentes ADD COLUMN c_soli_int numeric(10,2);

-- AVISO IMPORTANTE
-- Esta query hay que revisarla a mano
WITH utentes_and_fontes AS (
    SELECT
        u.exp_id
        -- , e.gid as exp_gid
        , f.gid AS tmp_fonte_gid
        , f.tipo_agua as tipo_agua_fonte, f.tipo_fonte, f.d_dado, f.sist_med, f.c_real, f.c_soli, f.lat_lon, f.observacio
        , f.exp_id as fonte_exp_id
        , u.enlace
        , u.estado, u.d_emissao, u.d_validade, u.tipo_lic, u.tipo_agua tipo_agua_utente, u.n_licen_a, u.taxa_fixa, u.taxa_uso, u.pago_mes, u.iva, u.pago_iva, u.consumo_tipo, u.c_licencia, u.tipo_lic as workaround_tipo_lic, u.c_factura as consumo_fact
        , u.c_real AS utente_c_real
        , u.c_soli AS utente_c_soli

    FROM
        tmp_utentes u
        -- FULL OUTER JOIN tmp_utentes u ON t.enlace = u.enlace AND t.exp_id = u.exp_id AND t.exp_name = u.exp_name
        FULL OUTER JOIN tmp_fontes f ON u.exp_id = f.exp_id AND u.tipo_agua = f.tipo_agua
        -- JOIN utentes.exploracaos e ON u.exp_id = e.exp_id
), utentes_sin_fontes AS (
    SELECT
        u.exp_id, u.enlace, u.utente_c_real, u.utente_c_soli, u.tipo_agua_fonte, u.tipo_agua_utente
        -- , u.exp_gid
    FROM utentes_and_fontes u
    WHERE u.tmp_fonte_gid IS NULL
)
UPDATE tmp_utentes t SET
    c_real_int = u.utente_c_real
    , c_soli_int = u.utente_c_soli
FROM utentes_sin_fontes u
WHERE
    t.enlace = u.enlace
    AND t.tipo_agua = u.tipo_agua_utente
;


WITH tmp AS (
    SELECT
        exp_id, estado, d_emissao, d_validade, tipo_lic, tipo_agua, n_licen_a, taxa_fixa, taxa_uso, pago_mes, iva, pago_iva, consumo_tipo as consumo_tipo, c_licencia, tipo_lic as workaround_tipo_lic, c_factura as consumo_fact
        , c_real_int
        , c_soli_int
        , row_number() OVER (PARTITION BY exp_id)
    FROM tmp_utentes
    WHERE
       tipo_agua IS NOT NULL
       OR
       estado IN ( SELECT key from domains.licencia_estado WHERE parent IN ('postcampo', 'post-licenciada') )
    ORDER BY exp_id
)
INSERT INTO utentes.licencias (exploracao, lic_nro, tipo_agua, estado, d_emissao, d_validade, c_licencia, iva, taxa_fixa, taxa_uso, pago_mes, pago_iva, n_licen_a, tipo_lic, consumo_tipo, consumo_fact, c_real_int, c_soli_int)
SELECT
    (SELECT gid FROM utentes.exploracaos e WHERE e.exp_id = tmp.exp_id),
    exp_id || '/' || substring(tipo_agua, 0, 4),
    tipo_agua,
    estado,
    d_emissao,
    d_validade,
    c_licencia,
    iva, -- 12.75
    taxa_fixa,
    taxa_uso, -- CASE tipo_agua WHEN 'Subterrânea' THEN 0.6 ELSE NULL END,
    pago_mes,
    pago_iva,
    n_licen_a,
    workaround_tipo_lic, --'Licença',
    consumo_tipo,
    consumo_fact
    , c_real_int
    , c_soli_int
FROM tmp
ORDER BY 1;


WITH tmp AS (
    SELECT exploracao, tipo_agua, sum(COALESCE(c_soli, 0)) as con_soli, sum(COALESCE(c_real, 0)) as con_real
    FROM utentes.fontes
    WHERE exploracao > ${LAST_EXP_GID}
    GROUP BY exploracao, tipo_agua
)
    UPDATE utentes.licencias l SET c_soli_fon = con_soli, c_real_fon = con_real FROM tmp WHERE l.exploracao = tmp.exploracao AND l.tipo_agua = tmp.tipo_agua
;


UPDATE utentes.licencias SET
    c_soli_tot = COALESCE(c_soli_int, 0) + COALESCE(c_soli_fon, 0),
    c_real_tot = COALESCE(c_real_int, 0) + COALESCE(c_real_fon, 0)
WHERE exploracao > ${LAST_EXP_GID}
;


WITH tmp AS (
    SELECT exploracao, sum(COALESCE(c_licencia, 0)) AS c_li, sum(COALESCE(c_soli_tot, 0)) as c_sol_t, sum(COALESCE(c_real_tot, 0)) as c_r_t FROM utentes.licencias GROUP BY exploracao
)
UPDATE utentes.exploracaos e SET
    c_licencia = c_li,
    c_soli = c_sol_t,
    c_real = c_r_t
FROM tmp
WHERE
    tmp.exploracao = e.gid
    AND e.gid > ${LAST_EXP_GID}
;

UPDATE utentes.licencias SET taxa_fixa = 0 where taxa_fixa is null AND exploracao > ${LAST_EXP_GID};
UPDATE utentes.licencias SET taxa_uso = 0 where taxa_uso is null AND exploracao > ${LAST_EXP_GID};
UPDATE utentes.actividades_abastecemento b SET c_estimado = 0 FROM utentes.actividades a WHERE c_estimado IS NULL  AND a.gid = b.gid AND a.exploracao > ${LAST_EXP_GID};
UPDATE utentes.actividades_agricultura_rega b SET c_estimado = 0 FROM utentes.actividades a WHERE c_estimado IS NULL  AND a.gid = b.gid AND a.exploracao > ${LAST_EXP_GID};
UPDATE utentes.actividades_industria b SET c_estimado = 0 FROM utentes.actividades a WHERE c_estimado IS NULL  AND a.gid = b.gid AND a.exploracao > ${LAST_EXP_GID};
UPDATE utentes.actividades_pecuaria b SET c_estimado = 0 FROM utentes.actividades a WHERE c_estimado IS NULL  AND a.gid = b.gid AND a.exploracao > ${LAST_EXP_GID};
UPDATE utentes.actividades_saneamento b SET c_estimado = 0 FROM utentes.actividades a WHERE c_estimado IS NULL  AND a.gid = b.gid AND a.exploracao > ${LAST_EXP_GID};
UPDATE utentes.actividades_produccao_energia b SET c_estimado = 0 FROM utentes.actividades a WHERE c_estimado IS NULL  AND a.gid = b.gid AND a.exploracao > ${LAST_EXP_GID};
UPDATE utentes.actividades_piscicultura b SET c_estimado = 0 FROM utentes.actividades a WHERE c_estimado IS NULL  AND a.gid = b.gid AND a.exploracao > ${LAST_EXP_GID};

EOF

$PSQL $PG_CONNECTION -c "$main_sql"

N_CULTIVOS_DESPUES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM utentes.actividades_cultivos;")
N_EXPS_DESPUES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM utentes.exploracaos;")
N_EXPS_ANADIDAS=$((N_EXPS_DESPUES - N_EXPS_ANTES))
N_LICS_DESPUES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM utentes.licencias;")
N_LICS_ANADIDAS=$((N_LICS_DESPUES - N_LICS_ANTES))
N_FONTES_DESPUES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM utentes.fontes")
N_FONTES_ANADIDAS=$((N_FONTES_DESPUES - N_FONTES_ANTES))

printf 'Cultivos: Había %s. Hay %s\n' "${N_CULTIVOS_ANTES}" "${N_CULTIVOS_DESPUES}"
printf 'Explotaciones: Había %s. Hay %s. Se han añadido: %s\n' "${N_EXPS_ANTES}" "${N_EXPS_DESPUES}" "${N_EXPS_ANADIDAS}"
printf 'Licencias: Había %s Hay %s. Se han añadido: %s\n' "${N_LICS_ANTES}" "${N_LICS_DESPUES}" "${N_LICS_ANADIDAS}"
printf 'Fontes: Había %s Hay %s. Se han añadido: %s\n' "${N_FONtES_ANTES}" "${N_FONTES_DESPUES}" "${N_FONTES_ANADIDAS}"

$PSQL $PG_CONNECTION -c "
DROP TABLE IF EXISTS public.exploracaos_geoms;
DROP TABLE IF EXISTS public.tmp_utentes;
DROP TABLE IF EXISTS public.tmp_fontes;
DROP TABLE IF EXISTS public.tmp_cultivos;
DROP TABLE IF EXISTS public.tmp_reses;
DROP TABLE IF EXISTS public.cultivos_geoms;
"

PGOPTIONS='--client-min-messages=warning' $PSQL $PG_CONNECTION -c "DELETE FROM utentes.version;INSERT INTO utentes.version (version) VALUES ('${TODAY}');"
PGOPTIONS='--client-min-messages=warning' $PSQLC $PG_CONNECTION -c "VACUUM FULL ANALYZE;"

FOO="
--WITH tmp AS (
--   SELECT c.gid as actividad, a.exp_id, c.exploracao, area_p_ac, area_i_ac, area_m_ac  FROM tmp_utentes a JOIN utentes.exploracaos b ON a.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao WHERE a.tipo = 'Agro-Pecuária'
--)
--INSERT INTO utentes.actividades_agropecuaria (gid, area_pot, area_irri, area_medi) SELECT actividad, area_p_ac, area_i_ac, area_m_ac FROM tmp;


WITH tmp AS (
    SELECT c.tipo, c.gid as actividade, id_exp, tipo_res, n_reses, CASE tipo_res WHEN 'Avícola (Aves)' THEN 0.3 WHEN 'Caprino (Cabras)' THEN 5 WHEN 'Equino (Cavalos)' THEN 25 WHEN 'Ovino (Ovelhas)' THEN 5 WHEN 'Porcino (Porcos)' THEN 15 WHEN 'Vacuno (Vacas)' THEN 65 ELSE NULL END as consumo_res FROM public.tmp_reses a JOIN utentes.exploracaos b ON a.id_exp = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao WHERE tipo IN ('Pecuária', 'Agro-Pecuária')
)
INSERT INTO utentes.actividades_reses (actividade, reses_tipo, reses_nro, c_res, c_estimado)
SELECT actividade,
       tipo_res,
       n_reses,
       consumo_res,
       n_reses * consumo_res * 30 / 100
FROM tmp;

UPDATE utentes.actividades_pecuaria a SET n_res_tot = (SELECT count(*) FROM utentes.actividades_reses c WHERE c.actividade = a.gid);
UPDATE utentes.actividades_pecuaria a SET c_estimado = (SELECT sum(c_estimado) FROM utentes.actividades_reses c WHERE c.actividade = a.gid);



COMMIT;
"

workaround_post_insert

# Si es una actualización de datos. Creo una bd nueva, elimino lo existente
# y dumpeo los nuevos datos para poder generar un sql con el que actualizar
create_db_from_template "${DATABASE}" nueva_borrar
$PSQL -h localhost -p $PG_PORT -U postgres -d nueva_borrar -c "
DELETE FROM utentes.exploracaos WHERE gid <= ${LAST_EXP_GID};
DELETE FROM utentes.utentes WHERE gid IN (select u.gid as utente_gid FROM utentes.utentes u LEFT OUTER JOIN utentes.exploracaos e ON e.utente = u.gid WHERE e.gid IS NULL ORDER BY u.gid);
"
pg_dump -Fp --table='utentes.utentes' --table='utentes.exploracaos' --table='utentes.actividades*' --table='utentes.fontes' --table='utentes.licencias' -a -E UTF-8 -f update_${TODAY}_${DATABASE}_utentes.sql -h localhost -p $PG_PORT -U postgres -d nueva_borrar

cat ${METADATA_FOLDER}/post_update_sql.sql >> update_${TODAY}_${DATABASE}_utentes.sql

echo "Eliminar a mano del fichero de actualización las utentes ${UTENTES_TO_EXCLUDE_AND_DROP}. Obtener su gid del dump y actualizar las explocationes con ese gid (en caso de ser necesario que no debería)"
