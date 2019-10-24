#!/bin/bash

# set -e  # Porqué si se lanza desde cli se cierra el terminal

source ../server/variables.ini

drop_db_and_kickout_users() {
    local DATABASE="${1}"
    $PSQL -h localhost -U postgres -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname='${DATABASE}';"
    $DROPDB -h localhost -U postgres --if-exists "${DATABASE}"
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
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    $PGDUMP -h localhost -U postgres -Fc -Z9 -E UTF-8 -f "${DATABASE}.dump" "${DATABASE}"
}

create_last_db() {
    local DATABASE="${1}"
    local DUMP="${2}"
    drop_db_and_kickout_users "${DATABASE}"
    $CREATEDB -h localhost -U postgres "${DATABASE}"
    $PGRESTORE -h localhost -U postgres -d "${DATABASE}" "${DUMP}"
}

create_pre_db_backup() {
    local TEMPLATE="${1}"
    local DATABASE="${1}_pre_${TODAY}"
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
}

create_post_db_backup() {
    local TEMPLATE="${1}"
    local DATABASE="${1}_post_${TODAY}"
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
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
