#!/bin/bash

TODAY=`date +%Y%m%d`
PSQL="psql -X -q -v ON_ERROR_STOP=1 --pset pager=off"
PGDUMP="/usr/lib/postgresql/9.5/bin/pg_dump"

DATABASE=arasul

$PGDUMP -h localhost -U postgres -C -E UTF-8 -f ./fotos_inventario_${TODAY}.$1.backup -Fc -O -x -Z 9 --table inventario.acuiferos_imagenes --table inventario.barragens_imagenes --table inventario.estacoes_imagenes --table inventario.fontes_imagenes ${DATABASE}
