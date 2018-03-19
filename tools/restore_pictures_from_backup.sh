#!/bin/sh


BACKUP_FILE="${1}"
DATABASE=${2}

source ../server/variables.ini


if [ ! -f $BACKUP_FILE ] ; then
    echo "El fichero de backup debe existir"
    exit
fi

PSQL="/usr/lib/postgresql/${PG_VERSION}/bin/psql --no-psqlrc --quiet -v ON_ERROR_STOP=1 --pset pager=off"

PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM inventario.acuiferos_imagenes; DELETE FROM inventario.barragens_imagenes; DELETE FROM inventario.estacoes_imagenes; DELETE FROM inventario.fontes_imagenes;"

pg_restore -U postgres -h localhost -d ${DATABASE} -a -t acuiferos_imagenes ${BACKUP_FILE}
pg_restore -U postgres -h localhost -d ${DATABASE} -a -t barragens_imagenes ${BACKUP_FILE}
pg_restore -U postgres -h localhost -d ${DATABASE} -a -t estacoes_imagenes ${BACKUP_FILE}
pg_restore -U postgres -h localhost -d ${DATABASE} -a -t fontes_imagenes ${BACKUP_FILE}
