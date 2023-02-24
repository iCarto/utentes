#!/bin/bash

set -e

source ../server/variables.ini
source exit_codes.sh
source db_utils.sh

WHEN=$1 # pre | post

BACKUP_FOLDER="/var/www/sirha_${DBNAME}/backups/backup-entregas/${TODAY}/"

if [[ "${WHEN}" != 'pre' ]] && [[ "${WHEN}" != 'post' ]]; then
    echo "Parámetro no válido (pre|post): ${WHEN}"
    exit "${EX_PARAM}"
fi

echo "localhost"
echo "${DBNAME}"
echo "${WHEN}"
echo "${TODAY}"
echo "${BACKUP_FOLDER}"

mkdir -p "${BACKUP_FOLDER}"

BACKUP_DB="${DBNAME}_${WHEN}_${TODAY}"

create_db_from_template_and_dump "${DBNAME}" "${BACKUP_DB}" "${BACKUP_FOLDER}"
pg_dumpall --clean --roles-only -h localhost -p "${PG_PORT}" -U postgres -f "${BACKUP_FOLDER}/${DBNAME}_${WHEN}_${TODAY}_roles.sql"
