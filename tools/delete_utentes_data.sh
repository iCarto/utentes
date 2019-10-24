#!/bin/bash

set -e

source ../server/variables.ini

DATABASE="${1}"
if [ -z "${DATABASE}" ]; then
    echo "ERROR. Introduzca el nombre de la base de datos"
    exit 64
fi

$PSQL -h localhost -d "${DATABASE}" -U postgres -c "
  delete from utentes.documentos;
  delete from utentes.inventario_fontes;
  delete from utentes.settings;
  delete from utentes.users;
  delete from utentes.utentes;
  delete from utentes.version;
"

echo "foo" > bar
