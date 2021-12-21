#!/bin/bash

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

# shellcheck source=../../server/variables.ini
source "${this_dir}/../../server/variables.ini"

upload_shp() {
    local DBNAME="${1}"
    local SHP="${2}"
    local TABLE="${3}"
    ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "DROP TABLE IF EXISTS ${TABLE};"
    ENCODING="UTF-8"
    shp2pgsql -s 32737 -c -g geom -D -W "${ENCODING}" -N insert "${SHP}" "${TABLE}" | ${PSQL} -h localhost -U postgres -d "${DBNAME}"
}

upload_dbf() {
    local DBNAME="${1}"
    local SHP="${2}"
    local TABLE="${3}"
    ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "DROP TABLE IF EXISTS ${TABLE};"
    ENCODING="UTF-8"
    shp2pgsql -W "${ENCODING}" -n "${SHP}" "${TABLE}" | ${PSQL} -h localhost -U postgres -d "${DBNAME}"
}
