#!/bin/bash

# set -e  # Porqué si se lanza desde cli se cierra el terminal

source ../server/variables.ini

drop_db_and_kickout_users() {
    local DATABASE="${1}"
    $PSQL -h localhost -U postgres -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname='${DATABASE}';"
    
    # To avoid problems. Uncomment if following a flow where is
    # really needed
    # $DROPDB -h localhost -U postgres --if-exists "${DATABASE}"
}

create_db_from_template() {
    local TEMPLATE="${1}"
    local DATABASE="${2}"
    drop_db_and_kickout_users "${DATABASE}"
    $PSQL -h localhost -U postgres -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname='${TEMPLATE}';"
    $CREATEDB -h localhost -U postgres -T "${TEMPLATE}" "${DATABASE}"
}

create_db_from_template_and_dump() {
    local TEMPLATE="${1}"
    local DATABASE="${2}"
    # https://stackoverflow.com/a/2013589/930271
    # https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
    local BCK_FOLDER="${3:-$(pwd)}"
    
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    $PGDUMP -h localhost -U postgres -Fc -Z9 -E UTF-8 -f "${BCK_FOLDER}/${DATABASE}.dump" "${DATABASE}"
}

create_last_db() {
    local DATABASE="${1}"
    local DUMP="${2}"
    drop_db_and_kickout_users "${DATABASE}"
    $CREATEDB -h localhost -U postgres "${DATABASE}"
    $PGRESTORE -h localhost -U postgres -d "${DATABASE}" "${DUMP}"
}



dump_db() {
    local DATABASE="${1}"
    $PGDUMP -h localhost -U postgres -Fc -Z9 -E UTF-8 -f "${TODAY}_${DATABASE}.dump" "${DATABASE}"
}

dump_db_prod() {
    # Simplemente por unificar los nombres
    # Hay que mejorarlo
    local DATABASE="${1}"
    $PGDUMP -h localhost -U postgres -Fc -Z9 -E UTF-8 -f "${TODAY}_prod_${DATABASE}.dump" "${DATABASE}"
}
