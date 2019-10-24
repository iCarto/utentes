#!/bin/bash

set -e
source ../server/variables.ini
source db_utils.sh

SHP="${1}"
BASE_SPREADSHEET="${2}"
DATABASE="${3}"
METADATA_FILE="${4}"
CULTIVOS_SHP="${5}"

IETL_REPO="${HOME}/development/ietl/ietl"
FILTER_UTENTES_FROM_EXCEL="DELETE FROM tmp_utentes WHERE estado NOT IN ('Utente de usos comuns') AND nome != 'Miniarte, Lda';"

PG_CONNECTION="-h localhost -p $PG_PORT -d ${DATABASE} -U postgres"

WARNINGS_FILE="${TODAY}_warnings_file.txt"
echo "" > "${WARNINGS_FILE}"

# TODO in the cli
# source ../../server/variables.ini
# source bddunica.sh
# workon p36
# create_last_db arazambeze_prod_190922 ../../arazambeze_prod_190922.dump
# create_db_from_template arazambeze_prod_190922 test_arazambeze
# sqitch deploy test_arazambeze
# bash upload_arasul_data_4.sh 190923_ut_sin_licencia/Exploracoes_ARA_Zambeze/merge.shp 190923_ut_sin_licencia/190927_Utentes_ARA_Zambeze_Final_fpuga.xlsx test_arazambeze 190923_ut_sin_licencia/metadata.json 190923_ut_sin_licencia/Exploracoes_ARA_Zambeze/190916_Cultivos_CL.shp
# Edit output file

# TODO. In the cli. If shapes should be merged
# ogr2ogr -f 'ESRI Shapefile' merge.shp 190916_Exploracoes_CL.shp -lco ENCODING=UTF-8
# ogr2ogr -f 'ESRI Shapefile' -update -append merge.shp 190916_Exploracoes_SL.shp -nln merge -lco ENCODING=UTF-8

# El gid de la última explotación antes de arrancar este proceso cuando se
# estén mezclando con existentes.
LAST_EXP_GID=$($PSQL $PG_CONNECTION -c "SELECT max(gid) FROM utentes.exploracaos")
LAST_UT_GID=$($PSQL $PG_CONNECTION -c "SELECT max(gid) FROM utentes.utentes")

UTENTES_TO_EXCLUDE_AND_DROP="'Ncondezi Coal Company', 'Hidroeléctrica de Cahora Bassa - Songo', 'Ouça Moçambique (Espanhois)', 'JSPL Mozambique Minerais, Lda (Jindal)', 'Episteme Moç, Lda', 'Al Bustan Farms Lda', 'Hoyo-Hoyo', 'ENRC Mozambique, Lda'"

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
python "${IETL_REPO}/sanitize_spreadsheet.py" --bdd "${BASE_SPREADSHEET}" --metadata "${METADATA_FILE}" --ignore_header
# python "${IETL_REPO}/sanitize_spreadsheet.py" --bdd "${BASE_SPREADSHEET}" --metadata "${METADATA_FILE}"

# TODO: Comprobar el srs de las capas con geometría
upload() {
    file=$1
    table=$2
    echo "Subiendo ${file} a ${table}"
    $PSQL $PG_CONNECTION -c "DROP TABLE IF EXISTS $table;"
    ENCODING="UTF-8"
    shp2pgsql -s 32737 -W "${ENCODING}" -g geom "$file" "$table" | $PSQL $PG_CONNECTION
}

workaround_clear_utente_loc_fields_for_testing_purposes() {
    # Workaround
    utente_loc_fields=(loc_provin loc_distri loc_posto)
    sql_clear_utente_loc_fields=""
    for field in ${utente_loc_fields[*]}; do
        sql_clear_utente_loc_fields="$sql_clear_utente_loc_fields UPDATE tmp_utentes SET $field = NULL;"
    done
    $PSQL $PG_CONNECTION -c "$sql_clear_utente_loc_fields"
}

set_default_domains() {
    echo "Set default domains"
    NULL_VALUES=$($PSQL $PG_CONNECTION -c "SELECT enlace, exp_name FROM tmp_utentes WHERE fact_tipo IS NULL;")
    if [[ -n "${NULL_VALUES}" ]]; then
        echo -e "\nAVISO: Explotaciones con un valor a NULL que se ha corregido para: fact_tipo"
        echo -e "\nAVISO: Explotaciones con un valor a NULL que se ha corregido para: fact_tipo" >> "${WARNINGS_FILE}"
        echo "${NULL_VALUES}" >> "${WARNINGS_FILE}"
    fi
    $PSQL $PG_CONNECTION -c "UPDATE tmp_utentes SET fact_tipo = COALESCE(fact_tipo, 'Mensal');"

    NULL_VALUES=$($PSQL $PG_CONNECTION -c "SELECT enlace, exp_name FROM tmp_utentes WHERE consumo_tipo IS NULL;")
    if [[ -n "${NULL_VALUES}" ]]; then
        echo -e "\nAVISO: Explotaciones con un valor a NULL que se ha corregido para: consumo_tipo"
        echo -e "\nAVISO: Explotaciones con un valor a NULL que se ha corregido para: consumo_tipo" >> "${WARNINGS_FILE}"
        echo "${NULL_VALUES}" >> "${WARNINGS_FILE}"
    fi
    $PSQL $PG_CONNECTION -c "UPDATE tmp_utentes SET consumo_tipo = COALESCE(consumo_tipo, 'Fixo');"
}

rename_columns() {
    # TODO. Gestionar de otra forma. Un fichero de alias para ogr2ogr, ...
    echo "Rename columns"
    $PSQL $PG_CONNECTION -c "
       ALTER TABLE tmp_utentes RENAME COLUMN energia_ti TO energia_tipo;
       ALTER TABLE tmp_utentes RENAME COLUMN tipo_cons TO consumo_tipo;
   "
}

fix_domains_fuzzy() {
    $PSQL $PG_CONNECTION -c "
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
    LOC_PROVIN=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_provin FROM tmp_utentes WHERE trim(lower(loc_provin)) NOT IN (SELECT lower(key) FROM domains.provincia);")
    LOC_DISTRI=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_distri FROM tmp_utentes WHERE trim(lower(loc_distri)) NOT IN (SELECT lower(key) FROM domains.distrito);")
    LOC_POSTO=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_posto FROM tmp_utentes WHERE trim(lower(loc_posto)) NOT IN (SELECT lower(key) FROM domains.posto);")
    loc_prov_1=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_prov_1 FROM tmp_utentes WHERE trim(lower(loc_prov_1)) NOT IN (SELECT lower(key) FROM domains.provincia);")
    loc_dist_1=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_dist_1 FROM tmp_utentes WHERE trim(lower(loc_dist_1)) NOT IN (SELECT lower(key) FROM domains.distrito);")
    LOC_POSTO2=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_posto2 FROM tmp_utentes WHERE trim(lower(loc_posto2)) NOT IN (SELECT lower(key) FROM domains.posto);")
    LOC_BACIA=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_bacia FROM tmp_utentes WHERE trim(lower(loc_bacia)) NOT IN (SELECT lower(key) FROM domains.bacia);")
    LOC_SUBACI=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_subaci FROM tmp_utentes WHERE trim(lower(loc_subaci)) NOT IN (SELECT lower(key) FROM domains.subacia);")

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

    $PSQL $PG_CONNECTION -c "
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

check_bad_domains() {
    echo "check bad domains"
    LOC_PROVIN=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_provin FROM tmp_utentes WHERE loc_provin NOT IN (SELECT key FROM domains.provincia);")
    if [[ -n "${LOC_PROVIN}" ]]; then
        echo -e "\nERROR: LOC_PROVIN, no correcto"
        echo "${LOC_PROVIN}"
    fi

    LOC_DISTRI=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_provin, loc_distri FROM tmp_utentes a LEFT OUTER JOIN domains.distrito b ON a.loc_provin = b.parent AND a.loc_distri = b.key WHERE a.loc_distri IS NOT NULL AND b.parent IS NULL;")
    if [[ -n "${LOC_DISTRI}" ]]; then
        echo -e "\nERROR: LOC_DISTRI, no correcto"
        echo "${LOC_DISTRI}"
    fi

    LOC_POSTO=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_distri, loc_posto FROM tmp_utentes a LEFT OUTER JOIN domains.posto b ON a.loc_distri = b.parent AND a.loc_posto = b.key WHERE a.loc_posto IS NOT NULL AND b.parent IS NULL;")
    if [[ -n "${LOC_POSTO}" ]]; then
        echo -e "\nERROR: LOC_POSTO, no correcto"
        echo "${LOC_POSTO}"
    fi

    loc_prov_1=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_prov_1 FROM tmp_utentes WHERE loc_prov_1 NOT IN (SELECT key FROM domains.provincia);")
    if [[ -n "${loc_prov_1}" ]]; then
        echo -e "\nERROR: loc_prov_1, no correcto"
        echo "${loc_prov_1}"
    fi

    loc_dist_1=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_prov_1, loc_dist_1 FROM tmp_utentes a LEFT OUTER JOIN domains.distrito b ON a.loc_prov_1 = b.parent AND a.loc_dist_1 = b.key WHERE a.loc_dist_1 IS NOT NULL AND b.parent IS NULL;")
    if [[ -n "${loc_dist_1}" ]]; then
        echo -e "\nERROR: loc_dist_1, no correcto"
        echo "${loc_dist_1}"
    fi

    loc_posto2=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_dist_1, loc_posto2 FROM tmp_utentes a LEFT OUTER JOIN domains.posto b ON a.loc_dist_1 = b.parent AND a.loc_posto2 = b.key WHERE b.parent IS NULL;")
    if [[ -n "${loc_posto2}" ]]; then
        echo -e "\nERROR: loc_posto2, no correcto"
        echo "${loc_posto2}"
    fi

    LOC_BACIA=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_bacia FROM tmp_utentes WHERE loc_bacia NOT IN (SELECT key FROM domains.bacia);")
    if [[ -n "${LOC_PROVIN}" ]]; then
        echo -e "\nERROR: LOC_PROVIN, no correcto"
        echo "${LOC_PROVIN}"
    fi

    loc_subaci=$($PSQL $PG_CONNECTION -c "SELECT gid, exp_id, loc_bacia, loc_subaci FROM tmp_utentes a LEFT OUTER JOIN domains.subacia b ON a.loc_bacia = b.parent AND a.loc_subaci = b.key WHERE a.loc_subaci IS NOT NULL AND b.parent IS NULL;")
    if [[ -n "${loc_subaci}" ]]; then
        echo -e "\nERROR: loc_subaci, no correcto"
        echo "${loc_subaci}"
    fi
}

fix_field_types() {
    echo "Fix field types"
    $PSQL $PG_CONNECTION -c "
    -- An example to be used when typecasting weird varchars to numeric
    -- ALTER TABLE tmp_fontes ALTER COLUMN c_soli TYPE NUMERIC(10, 2) USING to_number(replace(replace(c_soli, '.', ''), ',', '.'), '99999999999.99');
    -- the typecast to numeric with USING <field>::numeric(10,2) is needed when all values are null

    -- SELECT exp_name, d_emissao, to_date(d_emissao, 'YYYY/mm/dd'), to_date(d_emissao, 'YYYY-mm-dd') from tmp_utentes
    -- foo │ 2010/10/06 │ 2010-10-06 │ 2010-10-06

    -- Las fechas sólo deberían transformarse si están en formato texto. O
    -- encontrar un sistema genérico. Ahora es un rollo esto, hay que comentar
    -- y descomentar líneas y cambiar formatos de entrada todo el rato

    -- Idem con intentar hacer cambios sobre tablas/shps/hojas que no existe

    ALTER TABLE tmp_fontes ALTER COLUMN d_dado TYPE date USING to_date(d_dado, 'YYYY-mm-dd');
    ALTER TABLE tmp_fontes ALTER COLUMN c_soli TYPE NUMERIC(10, 2) USING c_soli::numeric(10,2);
    ALTER TABLE tmp_fontes ALTER COLUMN c_real TYPE NUMERIC(10, 2) USING c_real::numeric(10,2);
    ALTER TABLE tmp_fontes ALTER COLUMN c_max TYPE NUMERIC(10, 2) USING c_max::numeric(10,2);

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
    ALTER TABLE tmp_utentes ALTER COLUMN d_emissao TYPE date USING to_date(d_emissao, 'YYYY-mm-dd');
    ALTER TABLE tmp_utentes ALTER COLUMN d_validade TYPE date USING to_date(d_validade, 'YYYY-mm-dd');
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
    ALTER TABLE cultivos_geoms ALTER COLUMN c_estimad TYPE NUMERIC(10, 2) USING c_estimad::numeric(10, 2);
    "
}

ogr2ogr -f "ESRI Shapefile" "${FOLDER}/dbfs" "$XLSX" -lco ENCODING=UTF-8 --config OGR_ODS_HEADERS FORCE

upload "$SHP" "public.exploracaos_geoms"
upload "$CULTIVOS_SHP" "public.cultivos_geoms"
upload "${FOLDER}/dbfs/Fontes.dbf" "public.tmp_fontes"
upload "${FOLDER}/dbfs/Cultivos.dbf" "public.tmp_cultivos" # uten_n; id_exp; lic_n; tipo; tipo_rega; area; observacio
upload "${FOLDER}/dbfs/Utentes.dbf" "public.tmp_utentes"
upload "${FOLDER}/dbfs/Reses.dbf" "public.tmp_reses" # uten_n; id_exp; lic_n; tipo_res; n_reses

$PSQL $PG_CONNECTION -c "${FILTER_UTENTES_FROM_EXCEL}"

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

EXP_ID_DUPLICADOS=$($PSQL $PG_CONNECTION -c "
    select exp_id from tmp_utentes group by exp_id having count(*) > 1;
")
if [[ -n "${EXP_ID_DUPLICADOS}" ]]; then
    echo -e "\nERROR: Hay EXP_ID duplicados"
    echo "${EXP_ID_DUPLICADOS}"
    exit 1
fi

HAY_PECUARIA=$($PSQL $PG_CONNECTION -c "select 1 from tmp_utentes WHERE tipo ilike '%pecu%' limit 1;")
HAY_PECUARIA="" # ELIMINAR
if [[ -n "${HAY_PECUARIA}" ]]; then
    echo -e "\nHay Agro-Pecuaria o Pecuaria hay que gestionar las reses"
    exit 1
fi

# workaround_clear_utente_loc_fields_for_testing_purposes
# fix_domains_fuzzy

rename_columns

source ${METADATA_FOLDER}/workarounds.sh
workaround_190923

set_default_domains
fix_domains
check_bad_domains

# Geometrías que no enlazan por nombre. No pasa nada. SELECT a.gid, a.enlace, a.exp_name, b.gid, b.enlace, b.nome FROM tmp_utentes a FULL OUTER JOIN exploracaos_geoms b ON a.exp_name = b.nome WHERE a.gid IS NULL;

# Geometrías que no enlazan por "enlace". No debería pasar nunca pero puede pasar. Si el shape a sabiendas tiene geometrías que no se corresponden con las explotaciones.
ENLACE_GEOM_MAL=$($PSQL $PG_CONNECTION -c "SELECT a.gid, a.enlace, a.exp_name, b.gid, b.enlace, b.nome FROM tmp_utentes a FULL OUTER JOIN exploracaos_geoms b ON a.enlace = b.enlace WHERE a.gid IS NULL;")
ENLACE_GEOM_MAL="" # ELIMINAR
if [[ -n "${ENLACE_GEOM_MAL}" ]]; then
    echo -e "\nHay geometrías que no están enlazando"
    echo -e "${ENLACE_GEOM_MAL}"
    exit 1
fi

N_GEOMS_ENLAZAN=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM tmp_utentes a FULL OUTER JOIN exploracaos_geoms b ON a.enlace = b.enlace WHERE a.gid IS NOT NULL AND b.gid IS NOT NULL;")
N_GEOMS_TOTALES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM exploracaos_geoms;")
N_EXPS_TOTALES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM tmp_utentes;")
printf '
Número de geometrías que enlazan: %s
Número de geometrías totales: %s
Número de explotaciones totales: %s

' "${N_GEOMS_ENLAZAN}" "${N_GEOMS_TOTALES}" "${N_EXPS_TOTALES}"

$PSQL $PG_CONNECTION -c "
ALTER TABLE tmp_utentes ADD COLUMN geom geometry(MultiPolygon,32737);
UPDATE tmp_utentes a SET geom = ST_Transform(b.geom, 32737) FROM exploracaos_geoms b where a.enlace = b.enlace;
"

echo "FALTA ACORDAR UN MÉTODO DE GESTIONAR LOS CULTIVOS. CUIDADO CON ESTO"
N_CULTIVOS_ANTES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM utentes.actividades_cultivos;")
N_EXPS_ANTES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM utentes.exploracaos;")
N_LICS_ANTES=$($PSQL $PG_CONNECTION -c "SELECT count(*) FROM utentes.licencias;")

echo "Algún chequeo sobre fontes no venía mal"

! read -d '' main_sql << EOF


-- CONVERTIR EN UPSERT PARA QUE AL MENOS CUANDO LOS DATOS SEAN IGUALES NO DE PROBLEMAS
INSERT INTO utentes.utentes
(nome, uten_tipo, nuit, uten_gere, loc_provin, loc_distri, loc_posto, loc_nucleo, contacto, telefone, email, reg_comerc, reg_zona, loc_endere)
SELECT
nome, uten_tipo, nuit, uten_gere, loc_provin, loc_distri, loc_posto, loc_nucleo, contacto, telefone, email, reg_comerc, reg_zona, loc_endere
FROM tmp_utentes
WHERE nome NOT IN (${UTENTES_TO_EXCLUDE_AND_DROP}) -- gestionado aparte
group by
nome, uten_tipo, nuit, uten_gere, loc_provin, loc_distri, loc_posto, loc_nucleo, contacto, telefone, email, reg_comerc, reg_zona, loc_endere
;



INSERT INTO utentes.exploracaos
(exp_id, exp_name,  d_soli, pago_lic, observacio, loc_provin, loc_distri, loc_posto, loc_nucleo, loc_endere, loc_unidad, loc_bacia, loc_subaci, loc_rio, the_geom, utente, area, estado_lic, fact_tipo, cadastro_uni)
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
        a.cultivo,
        COALESCE(a.rega, 'Aspersão') as rega,
        CASE COALESCE(a.rega, 'Aspersão') WHEN 'Aspersão' THEN 0.76 WHEN 'Gota a gota' THEN 0.85 WHEN 'Gravidade' THEN 0.62 WHEN 'Regional' THEN NULL ELSE NULL END as eficiencia,
        a.area,
        a.observacio,
        row_number() OVER (PARTITION BY a.enlace)
        FROM tmp_cultivos a JOIN tmp_utentes u ON a.enlace = u.enlace JOIN utentes.exploracaos b ON u.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
        ORDER BY a.enlace
)
INSERT INTO utentes.actividades_cultivos(actividade, cult_id, c_estimado, cultivo, rega, eficiencia, area, observacio)
SELECT
       actividade
       , exp_id || '/' || trim(to_char(row_number, '000'))
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
FROM tmp;


-- Para cultivos_geoms
WITH tmp AS (
    SELECT
        a.enlace,
        a.cult_id,
        c.gid as actividade,
        b.exp_id as exp_id,
        a.cultivo,
        COALESCE(a.rega, 'Aspersão') as rega,
        CASE COALESCE(a.rega, 'Aspersão') WHEN 'Aspersão' THEN 0.76 WHEN 'Gota a gota' THEN 0.85 WHEN 'Gravidade' THEN 0.62 WHEN 'Regional' THEN NULL ELSE NULL END as eficiencia,
        a.area,
        a.observacio,
        a.geom
        FROM cultivos_geoms a JOIN tmp_utentes u ON a.enlace = u.enlace JOIN utentes.exploracaos b ON u.exp_id = b.exp_id JOIN utentes.actividades c ON b.gid = c.exploracao
        ORDER BY a.cult_id
)
INSERT INTO utentes.actividades_cultivos(actividade, cult_id, c_estimado, cultivo, rega, eficiencia, area, observacio, the_geom)
SELECT
    actividade
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


-- TODO. Comprobar enlaces
-- No deshacer el join con tmp_utentes porque permite filtrar los que se hayan
-- eliminado del excel original
INSERT INTO utentes.fontes
    (tipo_agua, tipo_fonte, d_dado, sist_med, c_real, c_soli, lat_lon, observacio
    , exploracao)
SELECT
    t.tipo_agua, t.tipo_fonte, t.d_dado, t.sist_med, t.c_real, t.c_soli, t.lat_lon, t.observacio
    , e.gid
    -- , t.enlace
FROM tmp_fontes t JOIN tmp_utentes u USING(enlace) JOIN utentes.exploracaos e ON u.exp_id = e.exp_id;


WITH utentes_and_fontes AS (
    SELECT
        u.exp_id
        , e.gid as exp_gid
        , f.tipo_agua, f.tipo_fonte, f.d_dado, f.sist_med, f.c_real, f.c_soli, f.lat_lon, f.observacio
        , f.enlace
    FROM tmp_utentes u FULL OUTER JOIN tmp_fontes f USING(enlace) JOIN utentes.exploracaos e ON u.exp_id = e.exp_id
) SELECT * FROM utentes_and_fontes;


ALTER TABLE tmp_utentes ADD COLUMN c_real_int numeric(10,2);
ALTER TABLE tmp_utentes ADD COLUMN c_soli_int numeric(10,2);

WITH utentes_and_fontes AS (
    SELECT
        u.exp_id
        , e.gid as exp_gid
        , f.gid AS tmp_fonte_gid
        , f.tipo_agua, f.tipo_fonte, f.d_dado, f.sist_med, f.c_real, f.c_soli, f.lat_lon, f.observacio
        , u.enlace
        , u.estado, u.d_emissao, u.d_validade, u.tipo_lic, u.tipo_agua, u.n_licen_a, u.taxa_fixa, u.taxa_uso, u.pago_mes, u.iva, u.pago_iva, u.consumo_tipo, u.c_licencia, u.tipo_lic as workaround_tipo_lic, u.c_factura as consumo_fact
        , u.c_real AS utente_c_real
        , u.c_soli AS utente_c_soli

    FROM tmp_utentes u FULL OUTER JOIN tmp_fontes f USING(enlace) JOIN utentes.exploracaos e ON u.exp_id = e.exp_id
), utentes_sin_fontes AS (
    SELECT u.exp_id, u.enlace, u.exp_gid, u.utente_c_real, u.utente_c_soli
    FROM utentes_and_fontes u
    WHERE u.tmp_fonte_gid IS NULL
)
UPDATE tmp_utentes t SET
    c_real_int = u.utente_c_real
    , c_soli_int = u.utente_c_soli
FROM utentes_sin_fontes u
WHERE t.enlace = u.enlace
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

printf 'Cultivos: Había %s. Hay %s\n' "${N_CULTIVOS_ANTES}" "${N_CULTIVOS_DESPUES}"
printf 'Explotaciones: Había %s. Hay %s. Se han añadido: %s\n' "${N_EXPS_ANTES}" "${N_EXPS_DESPUES}" "${N_EXPS_ANADIDAS}"
printf 'Licencias: Había %s Hay %s. Se han añadido: %s\n' "${N_LICS_ANTES}" "${N_LICS_DESPUES}" "${N_LICS_ANADIDAS}"

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

# Si es una actualización de datos. Creo una bd nueva, elimino lo existente
# y dumpeo los nuevos datos para poder generar un sql con el que actualizar
create_db_from_template "${DATABASE}" nueva_borrar
$PSQL -h localhost -p $PG_PORT -U postgres -d nueva_borrar -c "
DELETE FROM utentes.exploracaos WHERE gid <= ${LAST_EXP_GID};
DELETE FROM utentes.utentes WHERE gid IN (select u.gid as utente_gid FROM utentes.utentes u LEFT OUTER JOIN utentes.exploracaos e ON e.utente = u.gid WHERE e.gid IS NULL ORDER BY u.gid);
"
pg_dump -Fp --table='utentes.utentes' --table='utentes.exploracaos' --table='utentes.actividades*' --table='utentes.fontes' --table='utentes.licencias' -a -E UTF-8 -f update_${TODAY}_${DATABASE}_utentes.sql -h localhost -p $PG_PORT -U postgres -d nueva_borrar

cat ${METADATA_FOLDER}/post_update_sql.sql >> update_${TODAY}_${DATABASE}_utentes.sql

echo "Eliminar a mano del fichero de de actualización las utentes ${UTENTES_TO_EXCLUDE_AND_DROP}. Obtener su gid del dump y actualizar las explocationes con ese gid (en caso de ser necesario que no debería)"
