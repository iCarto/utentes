#!/bin/bash

# set -e  # Porqué si se lanza desde cli se cierra el terminal

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

# shellcheck source=../server/variables.ini
source "${this_dir}/../server/variables.ini"
# shellcheck source=exit_codes.sh
source "${this_dir}/exit_codes.sh"

kickout_users() {
    local DBNAME="${1}"
    ${PSQL} -h localhost -U postgres -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname='${DBNAME}';"
}

drop_db_and_kickout_users() {
    local DBNAME="${1}"

    kickout_users "${DBNAME}"

    # To avoid problems. Uncomment if following a flow where is
    # really needed
    ${DROPDB} -h localhost -U postgres --if-exists "${DBNAME}"
}

create_db_from_template() {
    local TEMPLATE="${1}"
    local DBNAME="${2}"
    kickout_users "${TEMPLATE}"
    drop_db_and_kickout_users "${DBNAME}"
    ${CREATEDB} -h localhost -U postgres -T "${TEMPLATE}" "${DBNAME}"
}

create_db_from_template_and_dump() {
    local TEMPLATE="${1}"
    local DBNAME="${2}"
    # https://stackoverflow.com/a/2013589/930271
    # https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
    local BCK_FOLDER="${3:-$(pwd)}"

    create_db_from_template "${TEMPLATE}" "${DBNAME}"
    ${PGDUMP} -h localhost -U postgres -Fc -Z9 -E UTF-8 -f "${BCK_FOLDER}/${DBNAME}.dump" "${DBNAME}"
}

create_last_db() {
    local DBNAME="${1}"
    local DUMP="${2}"
    drop_db_and_kickout_users "${DBNAME}"
    ${CREATEDB} -h localhost -U postgres "${DBNAME}"
    ${PGRESTORE} -h localhost -U postgres -d "${DBNAME}" "${DUMP}"
}

dump_db() {
    local DBNAME="${1}"
    local WHEN="${2:-bck}"
    local BCK_FOLDER="${3:-$(pwd)}"

    ${PGDUMP} -h localhost -U postgres -Fc -Z9 -E UTF-8 -f "${BCK_FOLDER}/${TODAY}_${WHEN}_${DBNAME}.dump" "${DBNAME}"
}

delete_all_data_in_schema() {
    # https://stackoverflow.com/questions/13223820/postgresql-delete-all-content
    # https://stackoverflow.com/questions/2829158/truncating-all-tables-in-a-postgres-database
    # https://stackoverflow.com/questions/58940086/is-it-possible-to-combine-c-and-v-in-psql
    local DBNAME="${1}"
    local SCHEMA="${2}"

    if [[ -z "${DBNAME}" ]]; then
        echo "ERROR. Introduzca el nombre de la base de datos"
        return "${EX_USAGE}"
    fi

    if [[ -z "${SCHEMA}" ]]; then
        echo "ERROR. Introduzca el esquema"
        return "${EX_USAGE}"
    fi

    if [[ -z "${IETL_REPO}" ]]; then
        echo "La variable IETL_REPO debe estar en el entorno"
        return "${EX_USAGE}"
    fi

    sql_query=$(python "${IETL_REPO}/postgres/query_delete_all_data_in_schema.py" "${SCHEMA}")
    ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "${sql_query}"
}

echo "Puerto en uso: ${PG_PORT}"
