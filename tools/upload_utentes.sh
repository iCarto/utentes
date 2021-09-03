#!/bin/bash

set -e
source ../server/variables.ini
source db_utils.sh
source upload_utentes_functions.sh
source bash-functions/shp_dbf_to_db.sh

DATABASE="${1}"
SHP="${2}"
BASE_SPREADSHEET="${3}"
METADATA_FILE="${4}"
CULTIVOS_SHP="${5}"

# REVIEW IN EACH PROCESS
# FILTER_UTENTES_FROM_EXCEL="DELETE FROM tmp_utentes WHERE estado NOT IN ('Utente de usos comuns') AND nome != 'Miniarte, Lda';"
FILTER_UTENTES_FROM_EXCEL=""
# UTENTES_TO_EXCLUDE_AND_DROP="WHERE nome NOT IN ('Ncondezi Coal Company', 'Hidroeléctrica de Cahora Bassa - Songo', 'Ouça Moçambique (Espanhois)', 'JSPL Mozambique Minerais, Lda (Jindal)', 'Episteme Moç, Lda', 'Al Bustan Farms Lda', 'Hoyo-Hoyo', 'ENRC Mozambique, Lda')
UTENTES_TO_EXCLUDE_AND_DROP="WHERE nome NOT IN ('Adelina Jaime Zandamela', 'Afonso Ezequias Chongo', 'Agostinho Joaquim Ubisse', 'Albino Pinto', 'Alice Alexandre Machehane', 'Anacleto Jaime Maxaieie', 'António Jeremias Manhice', 'Arlindo Fernando Augusto Banze', 'Armando Domingos Cabral', 'Brito Paulino', 'Calmo Alberto Nwalane', 'Calmo Alberto Nwalane', 'Calmo Alberto Nwalane', 'Carlos Vicente Duvane', 'Castigo Ernesto Mirole', 'Companhia Açucareira de Calanga Lda', 'Custódio Carlos Cossa', 'Daniel Marcos Cuamba', 'Daniel Marcos Cuamba', 'Daniel Marcos Cuamba', 'Daniel Marcos Cuamba', 'Daniel Marcos Cuamba', 'Daniel Marcos Cuamba', 'Daniel Marcos Cuamba', 'Daniel Marcos Cuamba', 'Daniel Marcos Cuamba', 'David Silvestre Tembe', 'Dionísio João Magalhães', 'Eduardo Rungo Mangueze', 'Fernando Mundau Matola', 'Godinho Tive Valentim', 'Graça Fabião Maculuve', 'Guilherme Simão Tamele', 'Isac Mussagy Daia', 'Isac Mussagy Daia', 'Isac Mussagy Daia', 'Isac Mussagy Daia', 'Isac Mussagy Daia', 'Jacob Nassone Macambe', 'João Alves Gabriel Bessa', 'João António', 'Joaquim Albino Ngoluja', 'José Guiliche Cumbane', 'Luís Faquene', 'Luís Faquene', 'Luís Taca', 'Mahesh Santilal', 'Maragra Açúcar, sarl', 'Maragra Açúcar, sarl', 'Maragra Açúcar, sarl', 'Maragra Açúcar, sarl', 'Margarida Huxtable', 'Mario Jaime Pelembe', 'Marta António Mbebe', 'Oriel Zefanias Sitoe', 'Oriel Zefanias Sitoe', 'Pedro Benjamim Mabote', 'Rafa António Malhuza', 'Rafael Salomão Miambo', 'Reginaldo Jossias Nhantumbo', 'Rodrigues Nasceu Muchongo', 'Sancho Domingos', 'Saraiva José Muando', 'Sérgio José Mulhovo', 'Tiago Jorge Cuna', 'TPH Mocambique, Lda', 'Valentim Machavane', 'Vicente Emília Henriqueta Luís')"

IETL_REPO="${HOME}/development/ietl/ietl"
PG_CONNECTION="-h localhost -p ${PG_PORT} -d ${DATABASE} -U postgres"

WARNINGS_FILE="${TODAY}_warnings_file.txt"
echo "" > "${WARNINGS_FILE}"

# El gid de la última explotación antes de arrancar este proceso cuando se
# estén mezclando con existentes.
LAST_EXP_GID=$(${PSQL} ${PG_CONNECTION} -c "SELECT COALESCE(max(gid), 0) FROM utentes.exploracaos")
LAST_UT_GID=$(${PSQL} ${PG_CONNECTION} -c "SELECT COALESCE(max(gid), 0) FROM utentes.utentes")

printf 'Último exp-gid existente: %s. Último ute-gid existente %s\n' "${LAST_EXP_GID}" "${LAST_UT_GID}"

python prepare_data.py "${BASE_SPREADSHEET}" "${DATABASE}" "${METADATA_FILE}" "${LAST_EXP_GID}" --shp "${SHP}"

FOLDER="$(dirname "${SHP}")/output"
rm -rf "${FOLDER}"
mkdir -p "${FOLDER}"
cp "${BASE_SPREADSHEET}" "${FOLDER}"
BASE_SPREADSHEET="${FOLDER}/$(basename "${BASE_SPREADSHEET}")"
XLSX="${FOLDER}/working.ods"
METADATA_FOLDER="$(dirname "${METADATA_FILE}")"

# TODO. Always check if --ignore_header is what you want
python "${IETL_REPO}/sanitize_spreadsheet.py" --bdd "${BASE_SPREADSHEET}" --metadata "${METADATA_FILE}"
ogr2ogr -f "ESRI Shapefile" "${FOLDER}/dbfs" "${XLSX}" -lco ENCODING=UTF-8 --config OGR_ODS_HEADERS FORCE

upload_shp "${DATABASE}" "${SHP}" "public.exploracaos_geoms"
upload_shp "${DATABASE}" "${CULTIVOS_SHP}" "public.cultivos_geoms"
upload_dbf "${DATABASE}" "${FOLDER}/dbfs/Fontes.dbf" "public.tmp_fontes"
upload_dbf "${DATABASE}" "${FOLDER}/dbfs/Cultivos.dbf" "public.tmp_cultivos"
upload_dbf "${DATABASE}" "${FOLDER}/dbfs/Utentes.dbf" "public.tmp_utentes"
upload_dbf "${DATABASE}" "${FOLDER}/dbfs/Reses.dbf" "public.tmp_reses"

if [ -n "${FILTER_UTENTES_FROM_EXCEL}" ]; then
    echo "Filtrando utentes: ${FILTER_UTENTES_FROM_EXCEL}"
    ${PSQL} ${PG_CONNECTION} -c "${FILTER_UTENTES_FROM_EXCEL}"
fi

rename_and_create_columns
fix_field_types_fontes
fix_field_types

# Si no hay un excel de cultivos pero sí un shape, relleno aquí tmp_cultivos
# no estará vacío en realidad habrá una fila
SIN_EXCEL_DE_CULTIVOS=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM tmp_cultivos;")
if [[ ${SIN_EXCEL_DE_CULTIVOS} == 1 ]]; then
    ${PSQL} ${PG_CONNECTION} -c "
        DELETE FROM tmp_cultivos;

        INSERT INTO tmp_cultivos (cult_id, cultivo, rega, area, observacio, e_exp_id)
        SELECT cult_id, cultura, rega, area, observacio, e_exp_id FROM cultivos_geoms;
    "
fi

UTENTES_DUPLICADOS=$(${PSQL} ${PG_CONNECTION} -c "
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

# utentes que ya existen en la bd
# SELECT e.gid, e.nome, e.loc_provin, e.loc_distri, e.loc_posto FROM utentes.utentes e JOIN tmp_utentes t ON t.nome = e.nome ORDER BY nome;

EXP_ID_DUPLICADOS_A=$(${PSQL} ${PG_CONNECTION} -c "
    select exp_id, count(*) from tmp_utentes group by exp_id having count(*) > 1 order by 2 asc, 1;
")
EXP_ID_DUPLICADOS_B=$(${PSQL} ${PG_CONNECTION} -c "
WITH foo AS (
    SELECT exp_id, count(*)
    FROM tmp_utentes
    GROUP BY
        nome, uten_tipo, nuit, uten_gere, contacto, telefone, email, loc_provin, loc_distri, loc_posto, loc_nucleo, loc_endere, reg_comerc, reg_zona
        , exp_id, exp_name, d_soli, pago_lice, observacio, loc_prov_1, loc_dist_1, loc_posto2, loc_nucl_1, loc_ende_1, loc_divisao, loc_bacia, loc_subaci, loc_rio
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
# En cierto momento se dejo de usar el campo "enlace" para emparejar datos y se
# empezó a usar "exp_id". Como todos los scripts estaban hechos para enlace lo
# que se está haciendo es en workaround hace enlace = exp_id
EXP_ID_DUPLICADOS=$(${PSQL} ${PG_CONNECTION} -c "
    select exp_id from exploracaos_geoms group by exp_id having count(*) > 1;
")
if [[ -n "${EXP_ID_DUPLICADOS}" ]]; then
    echo -e "\nERROR: Hay EXP_ID duplicados en exploracaos_geoms"
    echo "${EXP_ID_DUPLICADOS}"
    exit 1
fi

CULT_ID_DUPLICADOS=$(${PSQL} ${PG_CONNECTION} -c "
    select cult_id from tmp_cultivos group by cult_id having count(*) > 1;
")
if [[ -n "${CULT_ID_DUPLICADOS}" ]]; then
    echo -e "\nERROR: Hay cult_id duplicados en tmp_cultivos"
    echo "${CULT_ID_DUPLICADOS}"
    exit 1
fi

CULT_ID_DUPLICADOS=$(${PSQL} ${PG_CONNECTION} -c "
    select cult_id from cultivos_geoms group by cult_id having count(*) > 1;
")
if [[ -n "${CULT_ID_DUPLICADOS}" ]]; then
    echo -e "\nERROR: Hay cult_id duplicados en cultivos_geoms"
    echo "${CULT_ID_DUPLICADOS}"
    exit 1
fi

HAY_PECUARIA=$(${PSQL} ${PG_CONNECTION} -c "select 1 from tmp_utentes WHERE tipo ilike '%pecu%' limit 1;")
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

N_GEOMS_ENLAZAN=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM tmp_utentes a FULL OUTER JOIN exploracaos_geoms b ON a.enlace = b.enlace WHERE a.gid IS NOT NULL AND b.gid IS NOT NULL;")
N_GEOMS_TOTALES=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM exploracaos_geoms;")
N_EXPS_TOTALES=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM tmp_utentes;")
printf '
Número de geometrías que enlazan: %s
Número de geometrías totales: %s
Número de explotaciones totales: %s

' "${N_GEOMS_ENLAZAN}" "${N_GEOMS_TOTALES}" "${N_EXPS_TOTALES}"

# Geometrías que no enlazan por nombre. No pasa nada. SELECT a.gid, a.enlace, a.exp_name, b.gid, b.enlace, b.nome FROM tmp_utentes a FULL OUTER JOIN exploracaos_geoms b ON a.exp_name = b.nome WHERE a.gid IS NULL;

# Geometrías que no enlazan por "enlace". No debería pasar nunca pero puede pasar. Si el shape a sabiendas tiene geometrías que no se corresponden con las explotaciones.
ENLACE_GEOM_MAL=$(${PSQL} ${PG_CONNECTION} -c "SELECT a.gid, a.enlace, a.exp_name, b.gid, b.enlace, b.exp_name FROM tmp_utentes a FULL OUTER JOIN exploracaos_geoms b ON a.enlace = b.enlace WHERE a.gid IS NULL;")
if [[ -n "${ENLACE_GEOM_MAL}" ]]; then
    echo -e "\nHay geometrías que no están enlazando"
    echo -e "${ENLACE_GEOM_MAL}"
    exit 1
fi

${PSQL} ${PG_CONNECTION} -c "
UPDATE tmp_utentes a SET geom = ST_Transform(b.geom, 32737) FROM exploracaos_geoms b where a.enlace = b.enlace;
"

# GEOMETRÍAS CULTIVOS
N_GEOMS_ENLAZAN=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM tmp_cultivos a FULL OUTER JOIN cultivos_geoms b ON a.cult_id = b.cult_id WHERE a.gid IS NOT NULL AND b.gid IS NOT NULL;")
N_GEOMS_TOTALES=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM cultivos_geoms;")
N_EXPS_TOTALES=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM tmp_cultivos;")
printf '
Cultivos. Si hay más geometrías enlazando que totales, hay algún problema. Si es al revés no.
Número de geometrías que enlazan: %s
Número de geometrías totales: %s
Número de explotaciones totales: %s

' "${N_GEOMS_ENLAZAN}" "${N_GEOMS_TOTALES}" "${N_EXPS_TOTALES}"

# Geometrías de cultivos que no enlazan
unset ENLACE_GEOM_MAL
ENLACE_GEOM_MAL=$(${PSQL} ${PG_CONNECTION} -c "SELECT a.gid, a.enlace, a.cult_id, b.gid, b.enlace, b.cult_id FROM tmp_cultivos a FULL OUTER JOIN cultivos_geoms b ON a.cult_id = b.cult_id WHERE a.gid IS NULL;")
if [[ -n "${ENLACE_GEOM_MAL}" ]]; then
    echo -e "\nHay geometrías que no están enlazando"
    echo -e "${ENLACE_GEOM_MAL}"
    exit 1
fi
${PSQL} ${PG_CONNECTION} -c "
UPDATE tmp_cultivos a SET geom = ST_Transform(b.geom, 32737) FROM cultivos_geoms b where a.cult_id = b.cult_id;
"

N_CULTIVOS_ANTES=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM utentes.actividades_cultivos;")
N_EXPS_ANTES=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM utentes.exploracaos;")
N_LICS_ANTES=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM utentes.licencias;")
N_FONTES_ANTES=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM utentes.fontes;")

{
    echo "
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
    "
    cat sql-functions/process_utentes.sql
    cat sql-functions/utentes_c_real_fon_c_soli_fon_y_derivados.sql
} > /tmp/process_utentes.sql

${PSQL} ${PG_CONNECTION} --set last_exp_gid="${LAST_EXP_GID}" -f /tmp/process_utentes.sql

N_CULTIVOS_DESPUES=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM utentes.actividades_cultivos;")
N_EXPS_DESPUES=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM utentes.exploracaos;")
N_EXPS_ANADIDAS=$((N_EXPS_DESPUES - N_EXPS_ANTES))
N_LICS_DESPUES=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM utentes.licencias;")
N_LICS_ANADIDAS=$((N_LICS_DESPUES - N_LICS_ANTES))
N_FONTES_DESPUES=$(${PSQL} ${PG_CONNECTION} -c "SELECT count(*) FROM utentes.fontes")
N_FONTES_ANADIDAS=$((N_FONTES_DESPUES - N_FONTES_ANTES))

printf 'Cultivos: Había %s. Hay %s\n' "${N_CULTIVOS_ANTES}" "${N_CULTIVOS_DESPUES}"
printf 'Explotaciones: Había %s. Hay %s. Se han añadido: %s\n' "${N_EXPS_ANTES}" "${N_EXPS_DESPUES}" "${N_EXPS_ANADIDAS}"
printf 'Licencias: Había %s Hay %s. Se han añadido: %s\n' "${N_LICS_ANTES}" "${N_LICS_DESPUES}" "${N_LICS_ANADIDAS}"
printf 'Fontes: Había %s Hay %s. Se han añadido: %s\n' "${N_FONtES_ANTES}" "${N_FONTES_DESPUES}" "${N_FONTES_ANADIDAS}"

${PSQL} ${PG_CONNECTION} -c "
DROP TABLE IF EXISTS public.exploracaos_geoms;
DROP TABLE IF EXISTS public.tmp_utentes;
DROP TABLE IF EXISTS public.tmp_fontes;
DROP TABLE IF EXISTS public.tmp_cultivos;
DROP TABLE IF EXISTS public.tmp_reses;
DROP TABLE IF EXISTS public.cultivos_geoms;
"

PGOPTIONS='--client-min-messages=warning' ${PSQL} ${PG_CONNECTION} -c "DELETE FROM utentes.version;INSERT INTO utentes.version (version) VALUES ('${TODAY}');"

workaround_post_insert

# Si es una actualización de datos. Creo una bd nueva, elimino lo existente
# y dumpeo los nuevos datos para poder generar un sql con el que actualizar
create_db_from_template "${DATABASE}" nueva_borrar
${PSQL} -h localhost -p "${PG_PORT}" -U postgres -d nueva_borrar -c "
DELETE FROM utentes.exploracaos WHERE gid <= ${LAST_EXP_GID};
DELETE FROM utentes.utentes WHERE gid IN (select u.gid as utente_gid FROM utentes.utentes u LEFT OUTER JOIN utentes.exploracaos e ON e.utente = u.gid WHERE e.gid IS NULL ORDER BY u.gid);
"
pg_dump -Fp --table='utentes.utentes' --table='utentes.exploracaos' --table='utentes.actividades*' --table='utentes.fontes' --table='utentes.licencias' -a -E UTF-8 -f "update_${TODAY}_${DATABASE}_utentes.sql" -h localhost -p "${PG_PORT}" -U postgres -d nueva_borrar

cat "${METADATA_FOLDER}/post_update_sql.sql" >> "update_${TODAY}_${DATABASE}_utentes.sql"

echo "Eliminar a mano del fichero de actualización las utentes ${UTENTES_TO_EXCLUDE_AND_DROP}. Obtener su gid del dump y actualizar las explocationes con ese gid (en caso de ser necesario que no debería)"
