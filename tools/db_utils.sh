#!/bin/bash

# set -e  # Porqué si se lanza desde cli se cierra el terminal

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

# shellcheck source=../server/variables.ini
source "${this_dir}/../server/variables.ini"
# shellcheck source=exit_codes.sh
source "${this_dir}/exit_codes.sh"

kickout_users() {
    local DATABASE="${1}"
    ${PSQL} -h localhost -U postgres -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname='${DATABASE}';"
}

drop_db_and_kickout_users() {
    local DATABASE="${1}"

    kickout_users "${DATABASE}"

    # To avoid problems. Uncomment if following a flow where is
    # really needed
    # ${DROPDB} -h localhost -U postgres --if-exists "${DATABASE}"
}

create_db_from_template() {
    local TEMPLATE="${1}"
    local DATABASE="${2}"
    kickout_users "${TEMPLATE}"
    drop_db_and_kickout_users "${DATABASE}"
    ${CREATEDB} -h localhost -U postgres -T "${TEMPLATE}" "${DATABASE}"
}

create_db_from_template_and_dump() {
    local TEMPLATE="${1}"
    local DATABASE="${2}"
    # https://stackoverflow.com/a/2013589/930271
    # https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
    local BCK_FOLDER="${3:-$(pwd)}"

    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    ${PGDUMP} -h localhost -U postgres -Fc -Z9 -E UTF-8 -f "${BCK_FOLDER}/${DATABASE}.dump" "${DATABASE}"
}

create_last_db() {
    local DATABASE="${1}"
    local DUMP="${2}"
    drop_db_and_kickout_users "${DATABASE}"
    ${CREATEDB} -h localhost -U postgres "${DATABASE}"
    ${PGRESTORE} -h localhost -U postgres -d "${DATABASE}" "${DUMP}"
}

dump_db() {
    local DATABASE="${1}"
    local WHEN="${2:-bck}"
    local BCK_FOLDER="${3:-$(pwd)}"

    ${PGDUMP} -h localhost -U postgres -Fc -Z9 -E UTF-8 -f "${BCK_FOLDER}/${TODAY}_${WHEN}_${DATABASE}.dump" "${DATABASE}"
}

delete_all_data_in_schema() {
    # https://stackoverflow.com/questions/13223820/postgresql-delete-all-content
    # https://stackoverflow.com/questions/2829158/truncating-all-tables-in-a-postgres-database
    # https://stackoverflow.com/questions/58940086/is-it-possible-to-combine-c-and-v-in-psql
    local DATABASE="${1}"
    local SCHEMA="${2}"

    if [ -z "${DATABASE}" ]; then
        echo "ERROR. Introduzca el nombre de la base de datos"
        return "${EX_USAGE}"
    fi

    if [ -z "${SCHEMA}" ]; then
        echo "ERROR. Introduzca el esquema"
        return "${EX_USAGE}"
    fi

    sql_query=$(bash "${this_dir}/sql-functions/delete_all_data_in_schema.sh" "${SCHEMA}")
    ${PSQL} -h localhost -U postgres -d "${DATABASE}" -c "${sql_query}"
}
