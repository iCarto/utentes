#!/bin/bash

set -e

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

# paths partiendo de utentes-bd

# Capas finales
CBASE_FOLDER_PATH=""

# 2 Excel con las subacias de "ARA-Centro, IP" y "ARA-Sul, IP" resaltadas en color rojo en la carpeta
SUBACIAS_FOLDER_PATH=""

IETL_REPO=""

source scripts/db_utils.sh
source server/variables.ini

(cd "${CBASE_FOLDER_PATH}/01_Hidrologia" && rename 's/Divisoes/Unidades/' *Divisoes.*)
for i in arazambeze aracentro aracentronorte arasul aranorte; do dropdb -h localhost -p 9001 -U postgres --if-exists "test_${i}"; done
for i in arazambeze aracentro aracentronorte arasul aranorte; do createdb -h localhost -p 9001 -U postgres -T "${i}_post_210607" "test_${i}"; done
for i in arazambeze aracentro aracentronorte arasul aranorte; do sqitch deploy "test_${i}"; done

python scripts/populate_cbase.py "${CBASE_FOLDER_PATH}"

for i in arazambeze aracentro aracentronorte arasul aranorte; do psql -h localhost -p 9001 -U postgres -d "test_${i}" -f /tmp/salida.sql || break; done
psql -h localhost -p 9001 -U postgres -d "test_arasul" -f mapa_elle_arasul_bacia_representacion.sql

for i in arazambeze aracentro aracentronorte arasul aranorte; do
    errors=$($PSQL -h localhost -U postgres -d "test_${i}" -f scripts/sql-functions/check_ara_values_in_cbase.sql)
    if [[ -n $errors ]]; then
        echo "Valores incorrectos en el campo ara de cbase: ${errors}"
        break
    fi
done

python "${IETL_REPO}/postgres/serial_columns.py" localhost 9001 postgres test_aracentro --schema utentes --compare 'postgresql://postgres@localhost:9001/test_arazambeze'

$PSQL -h localhost -U postgres -d "test_arazambeze" -c "
UPDATE utentes.actividades SET gid = gid - 2082 + 194 + 1;
UPDATE utentes.actividades_cultivos SET gid = gid - 152 + 405 + 1;
UPDATE utentes.documentos SET gid = gid - 7 + 95 + 1;
UPDATE utentes.facturacao SET gid = gid - 197 + 1367 + 1;
UPDATE utentes.fontes SET gid = gid - 2007 + 103 + 1;
UPDATE utentes.licencias SET gid = gid - 2033 + 206 + 1;
UPDATE utentes.renovacoes SET gid = gid - 1 + 7 + 1;
UPDATE utentes.utentes SET gid = gid - 1765 + 178 + 1;
DELETE FROM utentes.users WHERE username IN ('icarto', 'admin');
UPDATE utentes.users SET id = id - 6 + 8 + 1 + 4;

ALTER TABLE utentes.documentos DROP CONSTRAINT documentos_exploracao_fkey;
ALTER TABLE utentes.documentos ADD FOREIGN KEY (exploracao) REFERENCES utentes.exploracaos(gid) ON UPDATE CASCADE ON DELETE SET NULL;
-- Cambiar ficheros adjuntos siguiendo el mismo cambio de numeración
UPDATE utentes.exploracaos SET gid = gid - 2084 + 191 + 1
ALTER TABLE utentes.documentos DROP CONSTRAINT documentos_exploracao_fkey;
ALTER TABLE utentes.documentos ADD FOREIGN KEY (exploracao) REFERENCES utentes.exploracaos(gid) ON UPDATE RESTRICT ON DELETE SET NULL;

DELETE FROM utentes.version;
"
pg_dump -a -b -n utentes --column-inserts -h localhost -p 9001 -U postgres -d test_arazambeze > from_arazambeze_to_aracentro.sql
$PSQL -h localhost -p 9001 -U postgres -d "test_aracentro" -f from_arazambeze_to_aracentro.sql

python "${IETL_REPO}/postgres/serial_columns.py"/postgres/serial_columns.py localhost 9001 postgres test_aracentronorte --schema utentes --compare 'postgresql://postgres@localhost:9001/test_aranorte'

$PSQL -h localhost -U postgres -d "test_aranorte" -c "
UPDATE utentes.actividades SET gid = gid - 52 + 744 + 1;
UPDATE utentes.actividades_cultivos SET gid = gid - 4 + 183 + 1;
-- UPDATE utentes.documentos SET gid = ;
-- UPDATE utentes.facturacao SET gid = ;
UPDATE utentes.fontes SET gid = gid - 49 + 800 + 1;
UPDATE utentes.licencias SET gid = gid - 50 + 758 + 1;
-- UPDATE utentes.renovacoes SET gid = ;
UPDATE utentes.utentes SET gid = gid - 46 + 731 + 1;
-- DELETE FROM utentes.users WHERE username IN ('icarto', 'admin');
-- UPDATE utentes.users SET id = ;


UPDATE utentes.exploracaos SET gid = gid - 49 + 745 + 1;


DELETE FROM utentes.version;
"
pg_dump -a -b -n utentes --column-inserts -h localhost -p 9001 -U postgres -d test_aranorte > from_aranorte_to_aracentronorte.sql
$PSQL -h localhost -p 9001 -U postgres -d "test_aracentronorte" -f from_aranorte_to_aracentronorte.sql

for i in arazambeze aracentro aracentronorte arasul aranorte; do dump_db "test_${i}" wip || break; done
