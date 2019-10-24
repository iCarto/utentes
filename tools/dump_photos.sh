#!/bin/bash

DATABASE=arasul

$PGDUMP -h localhost -U postgres -C -E UTF-8 -f ./fotos_inventario_${TODAY}.$1.backup -Fc -O -x -Z 9 --table inventario.acuiferos_imagenes --table inventario.barragens_imagenes --table inventario.estacoes_imagenes --table inventario.fontes_imagenes ${DATABASE}
