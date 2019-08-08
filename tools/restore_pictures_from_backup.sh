#!/bin/sh

BACKUP_FILE="${1}"
DATABASE=${2}

source ../server/variables.ini

if [ ! -f $BACKUP_FILE ]; then
    echo "El fichero de backup debe existir"
    exit
fi

PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM inventario.acuiferos_imagenes; DELETE FROM inventario.barragens_imagenes; DELETE FROM inventario.estacoes_imagenes; DELETE FROM inventario.fontes_imagenes;"

$PGRESTORE -U postgres -h localhost -d ${DATABASE} -a -t acuiferos_imagenes ${BACKUP_FILE}
$PGRESTORE -U postgres -h localhost -d ${DATABASE} -a -t barragens_imagenes ${BACKUP_FILE}
$PGRESTORE -U postgres -h localhost -d ${DATABASE} -a -t estacoes_imagenes ${BACKUP_FILE}
$PGRESTORE -U postgres -h localhost -d ${DATABASE} -a -t fontes_imagenes ${BACKUP_FILE}
