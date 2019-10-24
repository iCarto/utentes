#!/bin/bash

set -e
source ../server/variables.ini
source db_utils.sh
source bash_utils.sh

SHP="${1}"
ANALISE_SPREADSHEET="${2}"
# ANALISE_SHEETNAME="${3}"
ANALISE_SHEETNAME="Estacoes_analise_FINAL"
DATABASE="${3}"

METADATA_FILE="datos/191022_estaciones_aras/foo"
METADATA_FOLDER=$(dirname ${METADATA_FILE})

IETL_REPO="${HOME}/development/ietl/ietl"

ensure_file_exists "${SHP}"

python "${IETL_REPO}/sanitize_shp_fieldnames.py" "${SHP}" --output "${METADATA_FOLDER}/foo.shp" # Rewrite to only do this if strictly need

SHP="${METADATA_FOLDER}/foo.shp"

python "${IETL_REPO}/check_unique.py" "${SHP}" "cod_estac" --raise_error

EPSG="32737"
ENCODING="UTF-8"

OUTPUT=update_${TODAY}_${DATABASE}_estacoes.sql
# TODO. Por defecto shp2pgsql hace un INSERT de cada fila por separado y no usa
# transacciones. Con -D hace un COPY y mete la sentencia dentro de una
# transacción. En general -D es más manejable, pero a veces no interesa que
# vaya sólo el COPY en la transacción, por esto esta historia.
# Pensar como mejorarlo.

echo "
SET CLIENT_ENCODING TO UTF8;
SET STANDARD_CONFORMING_STRINGS TO ON;

BEGIN;

" > "${OUTPUT}"

cat "${METADATA_FOLDER}/pre_update_sql.sql" >> "${OUTPUT}"

ACTION="-a" # -d, -a, -c, -p
shp2pgsql "${ACTION}" -s "${EPSG}" -g geom -D -m mapping/estacoes.mapping -W "${ENCODING}" -N abort "${SHP}" inventario.estacoes \
    | sed 's/BEGIN;//' \
    | sed 's/COMMIT;//' \
    | sed 's/^SET.*//' >> "${OUTPUT}"

python $IETL_REPO/generate_insert_sql_from_spreadsheet.py "${ANALISE_SPREADSHEET}" "${ANALISE_SHEETNAME}" 'inventario.estacoes_analise' --header 2 --usecols 'B:BJ' >> "${OUTPUT}"

cat "${METADATA_FOLDER}/post_update_sql.sql" >> "${OUTPUT}"

echo "
COMMIT;
" >> "${OUTPUT}"

# $PSQL -h localhost -U postgres -d "${DATABASE}" -f new_sql_data/${DATABASE}_tmp_barragens.sql
# $PSQL -h localhost -U postgres -d "${DATABASE}" -f new_sql_data/process_barragens.sql
