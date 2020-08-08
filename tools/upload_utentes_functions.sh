#!/bin/bash

set -e

# TODO: Comprobar el srs de las capas con geometría
upload() {
    file=$1
    table=$2
    echo "Subiendo ${file} a ${table}"
    ${PSQL} ${PG_CONNECTION} -c "DROP TABLE IF EXISTS $table;"
    ENCODING="UTF-8"
    shp2pgsql -s 32737 -W "${ENCODING}" -g geom "$file" "$table" | ${PSQL} $PG_CONNECTION
}

fix_field_types() {
    # Habría que usar pandas/geopandas en lugar de esto
    echo "Fix field types"
    ${PSQL} ${PG_CONNECTION} -c "
    -- An example to be used when typecasting weird varchars to numeric
    -- ALTER TABLE tmp_fontes ALTER COLUMN c_soli TYPE NUMERIC(10, 2) USING to_number(replace(replace(c_soli, '.', ''), ',', '.'), '99999999999.99');
    -- the typecast to numeric with USING <field>::numeric(10,2) is needed when all values are null

    -- SELECT exp_name, d_emissao, to_date(d_emissao, 'YYYY/mm/dd'), to_date(d_emissao, 'YYYY-mm-dd') from tmp_utentes
    -- foo │ 2010/10/06 │ 2010-10-06 │ 2010-10-06

    -- Las fechas sólo deberían transformarse si están en formato texto. O
    -- encontrar un sistema genérico. Ahora es un rollo esto, hay que comentar
    -- y descomentar líneas y cambiar formatos de entrada todo el rato

    -- Idem con intentar hacer cambios sobre tablas/shps/hojas que no existe


    UPDATE tmp_fontes SET d_dado = replace(d_dado, '/', '-');
    --ALTER TABLE tmp_fontes ALTER COLUMN d_dado TYPE date USING to_date(d_dado, 'YYYY-mm-dd');
    ALTER TABLE tmp_fontes ALTER COLUMN d_dado TYPE date USING to_date(d_dado, 'dd-mm-YYYY');
    ALTER TABLE tmp_fontes ALTER COLUMN c_soli TYPE NUMERIC(10, 2) USING c_soli::numeric(10,2);
    ALTER TABLE tmp_fontes ALTER COLUMN c_real TYPE NUMERIC(10, 2) USING c_real::numeric(10,2);
    ALTER TABLE tmp_fontes ALTER COLUMN c_max TYPE NUMERIC(10, 2) USING c_max::numeric(10,2);

    UPDATE tmp_utentes SET d_soli = replace(d_soli, '/', '-');
    ALTER TABLE tmp_utentes ALTER COLUMN d_soli TYPE date USING to_date(d_soli, 'YYYY-mm-dd');
    -- SELECT 't'::boolean; devuelve true. y SELECT 'f'::boolean devuelve false
    ALTER TABLE tmp_utentes ALTER COLUMN pago_lice TYPE boolean USING pago_lice::boolean;
    UPDATE tmp_utentes SET pago_lice = FALSE where pago_lice is null;
    ALTER TABLE tmp_utentes ALTER COLUMN eval_impac TYPE boolean USING eval_impac::boolean;
    UPDATE tmp_utentes SET eval_impac = FALSE where eval_impac is null;

    ALTER TABLE tmp_utentes ALTER COLUMN habitantes TYPE integer USING habitantes::integer;
    ALTER TABLE tmp_utentes ALTER COLUMN area_pot TYPE NUMERIC(10, 4) USING area_pot::numeric(10,4);
    ALTER TABLE tmp_utentes ALTER COLUMN area_irri TYPE NUMERIC(10, 4) USING area_irri::numeric(10,4);
    ALTER TABLE tmp_utentes ALTER COLUMN area_medi TYPE NUMERIC(10, 4) USING area_medi::numeric(10,4);
    -- UPDATE tmp_utentes SET d_emissao = replace(d_emissao, '/', '-');
    -- ALTER TABLE tmp_utentes ALTER COLUMN d_emissao TYPE date USING to_date(d_emissao, 'YYYY-mm-dd');
    -- UPDATE tmp_utentes SET d_emissao = replace(d_emissao, '/', '-');
    -- ALTER TABLE tmp_utentes ALTER COLUMN d_validade TYPE date USING to_date(d_validade, 'YYYY-mm-dd');
    ALTER TABLE tmp_utentes ALTER COLUMN taxa_fixa TYPE NUMERIC(10, 2) USING taxa_fixa::numeric(10,2);
    ALTER TABLE tmp_utentes ALTER COLUMN taxa_uso TYPE NUMERIC(10, 2) USING taxa_uso::numeric(10,2);
    ALTER TABLE tmp_utentes ALTER COLUMN pago_mes TYPE NUMERIC(10, 2) USING pago_mes::numeric(10,2);
    ALTER TABLE tmp_utentes ALTER COLUMN iva TYPE NUMERIC(10, 2) USING iva::numeric(10,2);
    ALTER TABLE tmp_utentes ALTER COLUMN pago_iva TYPE NUMERIC(10, 2) USING pago_iva::numeric(10,2);
    ALTER TABLE tmp_utentes ALTER COLUMN c_licencia TYPE NUMERIC(10, 2) USING c_licencia::numeric(10,2);
    ALTER TABLE tmp_utentes ALTER COLUMN c_factura TYPE NUMERIC(10, 2) USING c_factura::numeric(10,2);
    ALTER TABLE tmp_utentes ALTER COLUMN potencia TYPE NUMERIC(10, 2) USING potencia::numeric(10,2);
    ALTER TABLE tmp_utentes ALTER COLUMN c_soli TYPE NUMERIC(10, 2) USING c_soli::numeric(10,2);
    ALTER TABLE tmp_utentes ALTER COLUMN c_real TYPE NUMERIC(10, 2) USING c_real::numeric(10,2);


    -- No se usa el campo. Se re-calcula
    -- ALTER TABLE tmp_utentes ALTER COLUMN c_estimado TYPE NUMERIC(10, 2) USING c_estimado::numeric(10,2);



    -- CHECK: https://github.com/OSGeo/gdal/issues/1238
    ALTER TABLE tmp_cultivos ALTER COLUMN area TYPE NUMERIC(10, 4) USING area::numeric(10,4);

    ALTER TABLE cultivos_geoms ALTER COLUMN eficiencia TYPE NUMERIC(10, 2) USING eficiencia::numeric(10, 2);
    ALTER TABLE cultivos_geoms ALTER COLUMN area TYPE NUMERIC(10, 2) USING area::numeric(10, 4);
    ALTER TABLE cultivos_geoms ALTER COLUMN c_estimado TYPE NUMERIC(10, 2) USING c_estimado::numeric(10, 2);
    "
}

workaround_clear_utente_loc_fields_for_testing_purposes() {
    # Workaround
    utente_loc_fields=(loc_provin loc_distri loc_posto)
    sql_clear_utente_loc_fields=""
    for field in ${utente_loc_fields[*]}; do
        sql_clear_utente_loc_fields="$sql_clear_utente_loc_fields UPDATE tmp_utentes SET $field = NULL;"
    done
    ${PSQL} ${PG_CONNECTION} -c "$sql_clear_utente_loc_fields"
}

set_default_domains() {
    echo "Set default domains"
    NULL_VALUES=$(${PSQL} ${PG_CONNECTION} -c "SELECT enlace, exp_name FROM tmp_utentes WHERE fact_tipo IS NULL;")
    if [[ -n "${NULL_VALUES}" ]]; then
        echo -e "\nAVISO: Explotaciones con un valor a NULL que se ha corregido para: fact_tipo"
        echo -e "\nAVISO: Explotaciones con un valor a NULL que se ha corregido para: fact_tipo" >> "${WARNINGS_FILE}"
        echo "${NULL_VALUES}" >> "${WARNINGS_FILE}"
    fi
    ${PSQL} ${PG_CONNECTION} -c "UPDATE tmp_utentes SET fact_tipo = COALESCE(fact_tipo, 'Mensal');"

    NULL_VALUES=$(${PSQL} ${PG_CONNECTION} -c "SELECT enlace, exp_name FROM tmp_utentes WHERE consumo_tipo IS NULL;")
    if [[ -n "${NULL_VALUES}" ]]; then
        echo -e "\nAVISO: Explotaciones con un valor a NULL que se ha corregido para: consumo_tipo"
        echo -e "\nAVISO: Explotaciones con un valor a NULL que se ha corregido para: consumo_tipo" >> "${WARNINGS_FILE}"
        echo "${NULL_VALUES}" >> "${WARNINGS_FILE}"
    fi
    ${PSQL} ${PG_CONNECTION} -c "UPDATE tmp_utentes SET consumo_tipo = COALESCE(consumo_tipo, 'Fixo');"

    NULL_VALUES=$(${PSQL} ${PG_CONNECTION} -c "SELECT enlace, cult_id FROM tmp_cultivos WHERE rega IS NULL;")
    if [[ -n "${NULL_VALUES}" ]]; then
        echo -e "\nAVISO: Cultivos con un valor a NULL que se ha corregido para: rega"
        echo -e "\nAVISO: Cultivos con un valor a NULL que se ha corregido para: rega" >> "${WARNINGS_FILE}"
        echo "${NULL_VALUES}" >> "${WARNINGS_FILE}"
    fi
    ${PSQL} ${PG_CONNECTION} -c "UPDATE tmp_cultivos SET rega = COALESCE(rega, 'Aspersão');"
}

rename_and_create_columns() {
    # TODO. Gestionar de otra forma. Un fichero de alias para ogr2ogr, ...
    echo "Rename columns"
    ${PSQL} ${PG_CONNECTION} -c "
       ALTER TABLE tmp_utentes RENAME COLUMN energia_ti TO energia_tipo;
       ALTER TABLE tmp_utentes RENAME COLUMN tipo_cons TO consumo_tipo;
       ALTER TABLE tmp_utentes ADD COLUMN geom geometry(MultiPolygon, 32737);
       ALTER TABLE tmp_cultivos ADD COLUMN geom geometry(MultiPolygon,32737);
   "
}

fix_domains_fuzzy() {
    ${PSQL} ${PG_CONNECTION} -c "
create EXTENSION pg_trgm ;
select set_limit(0.4);

WITH foo AS (
SELECT loc_provin, (SELECT key FROM domains.provincia WHERE loc_provin % key LIMIT 1) as corregido FROM tmp_utentes WHERE loc_provin NOT IN (SELECT key FROM domains.provincia WHERE KEY IS NOT NULL)
) UPDATE tmp_utentes a SET loc_provin = corregido from foo WHERE corregido IS NOT NULL AND a.loc_provin = foo.loc_provin;

WITH foo AS (
SELECT loc_provi2, (SELECT key FROM domains.provincia WHERE loc_provi2 % key LIMIT 1) as corregido FROM tmp_utentes WHERE loc_provi2 NOT IN (SELECT key FROM domains.provincia WHERE KEY IS NOT NULL)
) UPDATE tmp_utentes a SET loc_provi2 = corregido from foo WHERE corregido IS NOT NULL AND a.loc_provi2 = foo.loc_provi2;

WITH foo AS (
SELECT loc_distri, (SELECT key FROM domains.distrito WHERE loc_distri % key LIMIT 1) as corregido FROM tmp_utentes WHERE loc_distri NOT IN (SELECT key FROM domains.distrito WHERE KEY IS NOT NULL)
) UPDATE tmp_utentes a SET loc_distri = corregido from foo WHERE corregido IS NOT NULL AND a.loc_distri = foo.loc_distri;

WITH foo AS (
SELECT loc_distr2, (SELECT key FROM domains.distrito WHERE loc_distr2 % key LIMIT 1) as corregido FROM tmp_utentes WHERE loc_distr2 NOT IN (SELECT key FROM domains.distrito WHERE KEY IS NOT NULL)
) UPDATE tmp_utentes a SET loc_distr2 = corregido from foo WHERE corregido IS NOT NULL AND a.loc_distr2 = foo.loc_distr2;

WITH foo AS (
SELECT loc_posto, (SELECT key FROM domains.posto WHERE loc_posto % key LIMIT 1) as corregido FROM tmp_utentes WHERE loc_posto NOT IN (SELECT key FROM domains.posto WHERE KEY IS NOT NULL)
) UPDATE tmp_utentes a SET loc_posto = corregido from foo WHERE corregido IS NOT NULL AND a.loc_posto = foo.loc_posto;

WITH foo AS (
SELECT loc_posto2, (SELECT key FROM domains.posto WHERE loc_posto2 % key LIMIT 1) as corregido FROM tmp_utentes WHERE loc_posto2 NOT IN (SELECT key FROM domains.posto WHERE KEY IS NOT NULL)
) UPDATE tmp_utentes a SET loc_posto2 = corregido from foo WHERE corregido IS NOT NULL AND a.loc_posto2 = foo.loc_posto2;
"
}

fix_domains() {
    echo "Fix domains"
    LOC_PROVIN=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_provin FROM tmp_utentes WHERE trim(lower(loc_provin)) NOT IN (SELECT lower(key) FROM domains.provincia);")
    LOC_DISTRI=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_distri FROM tmp_utentes WHERE trim(lower(loc_distri)) NOT IN (SELECT lower(key) FROM domains.distrito);")
    LOC_POSTO=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_posto FROM tmp_utentes WHERE trim(lower(loc_posto)) NOT IN (SELECT lower(key) FROM domains.posto);")
    loc_prov_1=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_prov_1 FROM tmp_utentes WHERE trim(lower(loc_prov_1)) NOT IN (SELECT lower(key) FROM domains.provincia);")
    loc_dist_1=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_dist_1 FROM tmp_utentes WHERE trim(lower(loc_dist_1)) NOT IN (SELECT lower(key) FROM domains.distrito);")
    LOC_POSTO2=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_posto2 FROM tmp_utentes WHERE trim(lower(loc_posto2)) NOT IN (SELECT lower(key) FROM domains.posto);")
    LOC_BACIA=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_bacia FROM tmp_utentes WHERE trim(lower(loc_bacia)) NOT IN (SELECT lower(key) FROM domains.bacia);")
    LOC_SUBACI=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_subaci FROM tmp_utentes WHERE trim(lower(loc_subaci)) NOT IN (SELECT lower(key) FROM domains.subacia);")

    if [[ -n "${LOC_PROVIN}" ]]; then
        echo -e "\nAVISO: LOC_PROVIN, será corregido automáticamente"
        echo "${LOC_PROVIN}"
    fi
    if [[ -n "${LOC_DISTRI}" ]]; then
        echo -e "\nAVISO: LOC_DISTRI, será corregido automáticamente"
        echo "${LOC_DISTRI}"
    fi
    if [[ -n "${LOC_POSTO}" ]]; then
        echo -e "\nAVISO: LOC_POSTO, será corregido automáticamente"
        echo "${LOC_POSTO}"
    fi
    if [[ -n "${loc_prov_1}" ]]; then
        echo -e "\nAVISO: loc_prov_1, será corregido automáticamente"
        echo "${loc_prov_1}"
    fi
    if [[ -n "${loc_dist_1}" ]]; then
        echo -e "\nAVISO: loc_dist_1, será corregido automáticamente"
        echo "${loc_dist_1}"
    fi
    if [[ -n "${LOC_POSTO2}" ]]; then
        echo -e "\nAVISO: LOC_POSTO2, será corregido automáticamente"
        echo "${LOC_POSTO2}"
    fi
    if [[ -n "${LOC_BACIA}" ]]; then
        echo -e "\nAVISO: LOC_BACIA, será corregido automáticamente"
        echo "${LOC_BACIA}"
    fi
    if [[ -n "${LOC_SUBACI}" ]]; then
        echo -e "\nAVISO: LOC_SUBACI, será corregido automáticamente"
        echo "${LOC_SUBACI}"
    fi

    ${PSQL} ${PG_CONNECTION} -c "
        UPDATE tmp_utentes a SET loc_provin = b.key FROM domains.provincia b where trim(lower(a.loc_provin)) = lower(b.key);
        UPDATE tmp_utentes a SET loc_distri = b.key FROM domains.distrito b where trim(lower(a.loc_distri)) = lower(b.key);
        UPDATE tmp_utentes a SET loc_posto = b.key FROM domains.posto b where trim(lower(a.loc_posto)) = lower(b.key);

        UPDATE tmp_utentes a SET loc_prov_1 = b.key FROM domains.provincia b where trim(lower(a.loc_prov_1)) = lower(b.key);
        UPDATE tmp_utentes a SET loc_dist_1 = b.key FROM domains.distrito b where trim(lower(a.loc_dist_1)) = lower(b.key);
        UPDATE tmp_utentes a SET loc_posto2 = b.key FROM domains.posto b where trim(lower(a.loc_posto2)) = lower(b.key);

        UPDATE tmp_utentes a SET loc_bacia = b.key FROM domains.bacia b where trim(lower(a.loc_bacia)) = lower(b.key);
        UPDATE tmp_utentes a SET loc_subaci = b.key FROM domains.subacia b where trim(lower(a.loc_subaci)) = lower(b.key);
    "
}

fix_other_domains() {
    echo "Fix other domains"
    TCULTIVO=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, cultivo FROM tmp_cultivos WHERE cultivo = 'Outros';")
    if [[ -n "${TCULTIVO}" ]]; then
        echo -e "\nAVISO: TCULTIVO, será corregido automáticamente"
        echo "${TCULTIVO}"
    fi
    ${PSQL} ${PG_CONNECTION} -c "
        UPDATE tmp_cultivos SET cultivo = 'Outras' WHERE cultivo = 'Outros';
    "
}

check_bad_domains() {
    echo "check bad domains"
    LOC_PROVIN=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_provin FROM tmp_utentes WHERE loc_provin NOT IN (SELECT key FROM domains.provincia);")
    if [[ -n "${LOC_PROVIN}" ]]; then
        echo -e "\nERROR: LOC_PROVIN, no correcto"
        echo "${LOC_PROVIN}"
    fi

    LOC_DISTRI=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_provin, loc_distri FROM tmp_utentes a LEFT OUTER JOIN domains.distrito b ON a.loc_provin = b.parent AND a.loc_distri = b.key WHERE a.loc_distri IS NOT NULL AND b.parent IS NULL;")
    if [[ -n "${LOC_DISTRI}" ]]; then
        echo -e "\nERROR: LOC_DISTRI, no correcto"
        echo "${LOC_DISTRI}"
    fi

    LOC_POSTO=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_distri, loc_posto FROM tmp_utentes a LEFT OUTER JOIN domains.posto b ON a.loc_distri = b.parent AND a.loc_posto = b.key WHERE a.loc_posto IS NOT NULL AND b.parent IS NULL;")
    if [[ -n "${LOC_POSTO}" ]]; then
        echo -e "\nERROR: LOC_POSTO, no correcto"
        echo "${LOC_POSTO}"
    fi

    loc_prov_1=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_prov_1 FROM tmp_utentes WHERE loc_prov_1 NOT IN (SELECT key FROM domains.provincia);")
    if [[ -n "${loc_prov_1}" ]]; then
        echo -e "\nERROR: loc_prov_1, no correcto"
        echo "${loc_prov_1}"
    fi

    loc_dist_1=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_prov_1, loc_dist_1 FROM tmp_utentes a LEFT OUTER JOIN domains.distrito b ON a.loc_prov_1 = b.parent AND a.loc_dist_1 = b.key WHERE a.loc_dist_1 IS NOT NULL AND b.parent IS NULL;")
    if [[ -n "${loc_dist_1}" ]]; then
        echo -e "\nERROR: loc_dist_1, no correcto"
        echo "${loc_dist_1}"
    fi

    loc_posto2=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_dist_1, loc_posto2 FROM tmp_utentes a LEFT OUTER JOIN domains.posto b ON a.loc_dist_1 = b.parent AND a.loc_posto2 = b.key WHERE b.parent IS NULL;")
    if [[ -n "${loc_posto2}" ]]; then
        echo -e "\nERROR: loc_posto2, no correcto"
        echo "${loc_posto2}"
    fi

    LOC_BACIA=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_bacia FROM tmp_utentes WHERE loc_bacia NOT IN (SELECT key FROM domains.bacia);")
    if [[ -n "${LOC_PROVIN}" ]]; then
        echo -e "\nERROR: LOC_PROVIN, no correcto"
        echo "${LOC_PROVIN}"
    fi

    loc_subaci=$(${PSQL} ${PG_CONNECTION} -c "SELECT gid, exp_id, loc_bacia, loc_subaci FROM tmp_utentes a LEFT OUTER JOIN domains.subacia b ON a.loc_bacia = b.parent AND a.loc_subaci = b.key WHERE a.loc_subaci IS NOT NULL AND b.parent IS NULL;")
    if [[ -n "${loc_subaci}" ]]; then
        echo -e "\nERROR: loc_subaci, no correcto"
        echo "${loc_subaci}"
    fi
}
