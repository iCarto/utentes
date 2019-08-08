#!/bin/bash

set -e

source ../server/variables.ini

DATABASE="${1}"
if [ -z "${DATABASE}" ]; then
    echo "ERROR. Introduzca el nombre de la base de datos"
    exit 64
fi

$PSQL -h localhost -d "${DATABASE}" -U postgres -c "
    delete from inventario.acuiferos;
    delete from inventario.acuiferos_imagenes;
    delete from inventario.barragens;
    delete from inventario.barragens_imagenes;
    delete from inventario.dados_hidrometricos;
    delete from inventario.dados_pluviometricos;
    delete from inventario.estacoes;
    delete from inventario.estacoes_imagenes;
    delete from inventario.exploracoes;
    delete from inventario.fontes;
    delete from inventario.fontes_analise;
    delete from inventario.fontes_imagenes;
    delete from inventario.quantidade_agua;
    delete from inventario.version;
"
