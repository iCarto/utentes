#!/bin/bash

# set -e

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

source ../server/variables.ini
# shellcheck source=db_utils.sh
source db_utils.sh
# shellcheck source="scripts/bash-functions/shp_dbf_to_db.sh"
source "${this_dir}/bash-functions/shp_dbf_to_db.sh"

source upload_utentes_functions.sh

IETL_REPO="${HOME}/development/ietl/ietl"

upload_utentes_fontes() {
    local DBNAME="${1}"
    local BASE_SPREADSHEET="${2}"
    local METADATA_FILE="${3}"
    local BORRAR_EXISTENTES="${4:-false}" # true | false

    PG_CONNECTION="-h localhost -p ${PG_PORT} -d ${DBNAME} -U postgres"

    # El gid de la última explotación antes de arrancar este proceso cuando se
    # estén mezclando con existentes.
    LAST_FONTES=$(${PSQL} ${PG_CONNECTION} -c "SELECT max(gid) FROM utentes.fontes")

    # python prepare_data.py "${BASE_SPREADSHEET}" "${DBNAME}" "${METADATA_FILE}" "${LAST_FONTES}"

    SHP="${BASE_SPREADSHEET}"

    FOLDER="$(dirname "${SHP}")/output"
    rm -rf "${FOLDER}"
    mkdir -p "${FOLDER}"
    cp "${BASE_SPREADSHEET}" "${FOLDER}"
    BASE_SPREADSHEET="${FOLDER}/$(basename "${BASE_SPREADSHEET}")"
    XLSX="${FOLDER}/working.ods"
    METADATA_FOLDER="$(dirname "${METADATA_FILE}")"

    # TODO. Always check if `--ignore_header` is what you want
    python "${IETL_REPO}/sanitize_spreadsheet.py" --bdd "${BASE_SPREADSHEET}" --metadata "${METADATA_FILE}"

    ogr2ogr -f "ESRI Shapefile" "${FOLDER}/output/" "${XLSX}" -lco ENCODING=UTF-8 --config OGR_ODS_HEADERS FORCE

    upload_dbf "${DBNAME}" "${FOLDER}/output/Fontes_CL_UF.dbf" public.tmp_fontes

    fix_field_types_fontes

    {
        echo "BEGIN;"

        if "${BORRAR_EXISTENTES}"; then
            # echo "DELETE FROM utentes.fontes"
            echo "DELETE FROM utentes.fontes WHERE gid <= 2851;"
            # if "${REINICIAR_SEQ}"; then
            #     echo "ALTER SEQUENCE utentes.fontes_gid_seq RESTART 1;"
            # fi
        fi
        echo "
            -- Las fuentes luego las voy a exportar con el gid. Dejo huecos
            -- por si en prod siguen metiendo
            SELECT pg_catalog.setval('utentes.fontes_gid_seq', (SELECT last_value + 10 FROM utentes.fontes_gid_seq), true);

            UPDATE public.tmp_fontes SET cadastro = trim(cadastro);
            ALTER TABLE public.tmp_fontes ADD COLUMN exploracao integer;
            UPDATE public.tmp_fontes f SET exploracao = e.gid FROM utentes.exploracaos e WHERE e.exp_id = f.exp_id;
            INSERT INTO utentes.fontes
                (tipo_agua, tipo_fonte, lat_lon, d_dado, c_soli, c_max, c_real, metodo_est, observacio, exploracao, sist_med, disp_a, cadastro, red_monit, bombeo, prof_pozo, diametro)
            SELECT
                tipo_agua, tipo_fonte, lat_lon, d_dado, c_soli, c_max, c_real, metodo_est, observacio, exploracao, sist_med, disp_a, cadastro, red_monit, bombeo, prof_pozo, diametro
            FROM public.tmp_fontes
            ;
        "
        # cat "${METADATA_FOLDER}/workaround.sql"
        cat "sql-functions/utentes_c_real_fon_c_soli_fon_y_derivados.sql"

        echo "COMMIT;"
    } > /tmp/process_fontes.sql

    ${PSQL} ${PG_CONNECTION} --set last_exp_gid=-1 -f /tmp/process_fontes.sql

    # Si es una actualización de datos. Creo una bd nueva, elimino lo existente
    # y dumpeo los nuevos datos para poder generar un sql con el que actualizar
    create_db_from_template "${DBNAME}" nueva_borrar
    ${PSQL} ${PG_CONNECTION} -d nueva_borrar -c "DELETE FROM utentes.fontes WHERE gid <= ${LAST_FONTES};"

    {
        echo "BEGIN;"
        if "${BORRAR_EXISTENTES}"; then
            # echo "DELETE FROM utentes.fontes"
            echo "DELETE FROM utentes.fontes WHERE gid <= 2851;"
        fi
        ${PGDUMP} -Fp --table='utentes.fontes' -a -b -E UTF-8 -h localhost -U postgres -d nueva_borrar
        cat "sql-functions/utentes_c_real_fon_c_soli_fon_y_derivados.sql"
        echo "COMMIT;"
    } > "/tmp/update_${TODAY}_${DBNAME}_update_utentes_fontes.sql"
}
