#!/bin/bash

source ../server/variables.ini
source bash_utils.sh

BACKUP_FILE="${1}"
DBAME=${2}

ensure_file_exists "${BACKUP_FILE}"

PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBAME}" -c "DELETE FROM inventario.acuiferos_imagenes; DELETE FROM inventario.barragens_imagenes; DELETE FROM inventario.estacoes_imagenes; DELETE FROM inventario.fontes_imagenes;"

${PGRESTORE} -U postgres -h localhost -d "${DBAME}" -a -t acuiferos_imagenes "${BACKUP_FILE}"
${PGRESTORE} -U postgres -h localhost -d "${DBAME}" -a -t barragens_imagenes "${BACKUP_FILE}"
${PGRESTORE} -U postgres -h localhost -d "${DBAME}" -a -t estacoes_imagenes "${BACKUP_FILE}"
${PGRESTORE} -U postgres -h localhost -d "${DBAME}" -a -t fontes_imagenes "${BACKUP_FILE}"
