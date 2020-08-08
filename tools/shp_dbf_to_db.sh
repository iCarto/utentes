#!/bin/bash

source ../server/variables.ini

upload_shp() {
    local DATABASE="${1}"
    local SHP="${2}"
    local TABLE="${3}"
    ${PSQL} -h localhost -U postgres -d "${DATABASE}" -c "DROP TABLE IF EXISTS ${TABLE};"
    ENCODING="UTF-8"
    shp2pgsql -s 32737 -c -g geom -D -W ${ENCODING} -N insert "${SHP}" "$TABLE" | ${PSQL} -h localhost -U postgres -d "${DATABASE}"
}

upload_dbf() {
    local DATABASE="${1}"
    local SHP="${2}"
    local TABLE="${3}"
    ${PSQL} -h localhost -U postgres -d "${DATABASE}" -c "DROP TABLE IF EXISTS ${TABLE};"
    ENCODING="UTF-8"
    shp2pgsql -W ${ENCODING} -n "${SHP}" "${TABLE}" | ${PSQL} -h localhost -U postgres -d "${DATABASE}"
}
