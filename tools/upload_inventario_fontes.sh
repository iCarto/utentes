#!/bin/bash

# set -e

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

source ../server/variables.ini
# shellcheck source=db_utils.sh
source db_utils.sh
# shellcheck source="scripts/bash-functions/shp_dbf_to_db.sh"
source "${this_dir}/bash-functions/shp_dbf_to_db.sh"

IETL_REPO="${HOME}/development/ietl/ietl"

upload_inventario_fontes() {
    local DATABASE="${1}"
    local SHP="${2}"
    local BASE_SPREADSHEET="${3}"
    local METADATA_FILE="${4}"
    local BORRAR_EXISTENTES="${5:-false}" # true | false

    # Ajustas en cada ocasión
    # Puede ser que haya que borrar las fuentes pero resulte conveniente
    # mantener las imágenes. En este caso en workaround.sql habrá que
    # actualizar los códigos de "cadastro" si han cambiado
    local MANTENER_IMAGENES=true # true | false

    PG_CONNECTION="-h localhost -p ${PG_PORT} -d ${DATABASE} -U postgres"

    # El gid de la última explotación antes de arrancar este proceso cuando se
    # estén mezclando con existentes.
    LAST_FONTES=$(${PSQL} ${PG_CONNECTION} -c "SELECT max(gid) FROM inventario.fontes")
    LAST_FONTES_ANALISE=$(${PSQL} ${PG_CONNECTION} -c "SELECT max(gid) FROM inventario.fontes_analise")
    LAST_FONTES_CARAC_HIDRO=$(${PSQL} ${PG_CONNECTION} -c "SELECT max(gid) FROM inventario.fontes_carac_hidro")
    LAST_FONTES_LITOLOGIA=$(${PSQL} ${PG_CONNECTION} -c "SELECT max(gid) FROM inventario.fontes_litologia")
    LAST_QUANTIDADE_AGUA=$(${PSQL} ${PG_CONNECTION} -c "SELECT max(gid) FROM inventario.quantidade_agua")

    python prepare_data.py "${BASE_SPREADSHEET}" "${DATABASE}" "${METADATA_FILE}" "${LAST_FONTES}" --shp "${SHP}"

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

    upload_shp "${DATABASE}" "${SHP}" tmp_fontes_geoms
    upload_dbf "${DATABASE}" "${FOLDER}/output/Fontes_Final.dbf" tmp_fontes_final
    upload_dbf "${DATABASE}" "${FOLDER}/output/Fontes_analise.dbf" tmp_fontes_analise
    upload_dbf "${DATABASE}" "${FOLDER}/output/Fontes_Carac_Hidro.dbf" tmp_fontes_carac_hidro
    upload_dbf "${DATABASE}" "${FOLDER}/output/Fontes_Litologia.dbf" tmp_fontes_litolia
    upload_dbf "${DATABASE}" "${FOLDER}/output/Fontes_Quant_Agua.dbf" tmp_fontes_quant_agua

    {
        echo "BEGIN;"
        if "${MANTENER_IMAGENES}"; then
            echo "ALTER TABLE inventario.fontes_imagenes DROP CONSTRAINT fontes_imagenes_cadastro_fkey;"
        fi
        if "${BORRAR_EXISTENTES}"; then
            echo "DELETE FROM inventario.fontes;"
            # if "${REINICIAR_SEQ}"; then
            #     echo "
            #         ALTER SEQUENCE inventario.fontes_gid_seq RESTART 1;
            #         ALTER SEQUENCE inventario.fontes_analise_gid_seq RESTART 1;
            #         ALTER SEQUENCE inventario.fontes_carac_hidro_gid_seq RESTART 1;
            #         ALTER SEQUENCE inventario.fontes_litologia_gid_seq RESTART 1;
            #         ALTER SEQUENCE inventario.quantidade_agua_gid_seq RESTART 1;
            #     "
            # fi
        fi

        cat "sql-functions/process_fontes.sql"
        cat "${METADATA_FOLDER}/workaround.sql"
        cat "sql-functions/process_fontes_do_inserts.sql"
        if "${MANTENER_IMAGENES}"; then
            echo "ALTER TABLE inventario.fontes_imagenes ADD FOREIGN KEY (cadastro) REFERENCES inventario.fontes(cadastro) ON UPDATE CASCADE ON DELETE CASCADE;"
        fi
        echo "COMMIT;"
    } > /tmp/process_fontes.sql

    ${PSQL} ${PG_CONNECTION} -f /tmp/process_fontes.sql

    # Si es una actualización de datos. Creo una bd nueva, elimino lo existente
    # y dumpeo los nuevos datos para poder generar un sql con el que actualizar
    create_db_from_template "${DATABASE}" nueva_borrar
    ${PSQL} ${PG_CONNECTION} -d nueva_borrar -c "DELETE FROM inventario.fontes WHERE gid <= ${LAST_FONTES};"

    {
        echo "BEGIN;"
        if "${MANTENER_IMAGENES}"; then
            echo "ALTER TABLE inventario.fontes_imagenes DROP CONSTRAINT fontes_imagenes_cadastro_fkey;"
        fi
        if "${BORRAR_EXISTENTES}"; then
            echo "DELETE FROM inventario.fontes;"
        fi
        ${PGDUMP} -Fp --table='inventario.fontes' --table='inventario.fontes_analise' --table='inventario.fontes_carac_hidro' --table='inventario.fontes_litologia' --table='inventario.quantidade_agua' -a -b -E UTF-8 -h localhost -U postgres -d nueva_borrar
        if "${MANTENER_IMAGENES}"; then
            echo "ALTER TABLE inventario.fontes_imagenes ADD FOREIGN KEY (cadastro) REFERENCES inventario.fontes(cadastro) ON UPDATE CASCADE ON DELETE CASCADE;"
        fi
        echo "COMMIT;"
    } > "/tmp/update_${TODAY}_${DATABASE}.sql"
}
