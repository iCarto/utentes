#!/bin/bash

set -e
. ../server/variables.ini

# Kills all connections to the database to make the backup
$PSQL -h localhost -p ${PG_PORT} -U postgres -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname='${DB_NAME}';"


# Renames the database as backup if exists

# Other way to check if the database exists
# if ! sudo -u postgres psql -d ${DBNAME} -c "select 1" > /dev/null 2>&1; then
#     sudo -u postgres createdb -O senderos -E UTF-8 ${DBNAME}
# fi

DB_EXISTS=$($PSQL -t -h localhost -p ${PG_PORT} -U postgres -d postgres -c "SELECT 'True' FROM pg_database WHERE datname='${DBNAME}';")

if [[ "${DB_EXISTS}" -eq "True" ]] ; then
    $PSQL -h localhost -p ${PG_PORT} -U postgres -d postgres -c "ALTER DATABASE \"${DBNAME}\" RENAME TO \"${DBNAME}_tmp_${TODAY}\";"
fi


# Creates the database again
# https://www.postgresql.org/docs/current/static/manage-ag-templatedbs.html
createdb -h localhost -p ${PG_PORT} -U postgres -T template0 -O ${DBOWNER} -E UTF-8 -l ${LOCALE} ${DBNAME}
$PSQL -h localhost -p ${PG_PORT} -U postgres -d ${DBNAME} -c "CREATE EXTENSION IF NOT EXISTS postgis;"

