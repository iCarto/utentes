#!/bin/bash

set -e

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

# Capas finales
CBASE_FOLDER_PATH=""

IETL_REPO=""

source scripts/db_utils.sh
source server/variables.ini

(cd "${CBASE_FOLDER_PATH}/01_Hidrologia" && rename 's/Divisoes/Unidades/' *Divisoes.*)
for i in arazambeze aracentro aracentronorte arasul aranorte; do dropdb -h localhost -p 9001 -U postgres --if-exists "test_${i}"; done
for i in arazambeze aracentro aracentronorte arasul aranorte; do createdb -h localhost -p 9001 -U postgres -T "${i}_post_210607" "test_${i}"; done
for i in arazambeze aracentro aracentronorte arasul aranorte; do sqitch deploy "test_${i}"; done

python scripts/populate_cbase.py "${CBASE_FOLDER_PATH}"

for i in arazambeze aracentro aracentronorte arasul aranorte; do psql -h localhost -p 9001 -U postgres -d "test_${i}" -f /tmp/salida.sql || break; done

for i in arazambeze aracentro aracentronorte arasul aranorte; do
    psql -h localhost -p 9001 -U postgres -d "test_${i}" -c "WITH s AS ( SELECT parent FROM domains.subacia WHERE (SELECT key FROM domains.ara LIMIT 1) = ANY(app) GROUP BY parent HAVING count(*) > 1 ), to_update AS ( SELECT e.gid, e.exp_id, e.loc_unidad, e.loc_bacia, e.loc_subaci FROM utentes.exploracaos e JOIN s ON  e.loc_bacia = s.parent ) UPDATE utentes.exploracaos SET loc_subaci = NULL WHERE gid in (SELECT gid FROM to_update);
" || break
done

psql -h localhost -p 9001 -U postgres -d "test_arasul" -f mapa_elle_arasul_bacia_representacion.sql

for i in arazambeze aracentro aracentronorte arasul aranorte; do
    errors=$($PSQL -h localhost -U postgres -d "test_${i}" -f scripts/sql-functions/check_ara_values_in_cbase.sql)
    if [[ -n $errors ]]; then
        echo "Valores incorrectos en el campo ara de cbase: ${errors}"
        break
    fi
done

python "${IETL_REPO}/postgres/serial_columns.py" localhost 9001 postgres test_aracentro --schema utentes --compare 'postgresql://postgres@localhost:9001/test_arazambeze'

$PSQL -h localhost -U postgres -d "210825_bck_arazambeze" -c "
UPDATE utentes.actividades SET gid = ;
UPDATE utentes.actividades_cultivos SET gid = ;
UPDATE utentes.documentos SET gid = ;
UPDATE utentes.facturacao SET gid = ;
UPDATE utentes.fontes SET gid = ;
UPDATE utentes.licencias SET gid = ;
UPDATE utentes.renovacoes SET gid = ;
UPDATE utentes.utentes SET gid = ;
DELETE FROM utentes.users WHERE username IN ();
UPDATE utentes.users SET id = ;

ALTER TABLE utentes.documentos DROP CONSTRAINT documentos_exploracao_fkey;
ALTER TABLE utentes.documentos ADD FOREIGN KEY (exploracao) REFERENCES utentes.exploracaos(gid) ON UPDATE CASCADE ON DELETE SET NULL;
-- Cambiar ficheros adjuntos siguiendo el mismo cambio de numeración
UPDATE utentes.exploracaos SET gid =
ALTER TABLE utentes.documentos DROP CONSTRAINT documentos_exploracao_fkey;
ALTER TABLE utentes.documentos ADD FOREIGN KEY (exploracao) REFERENCES utentes.exploracaos(gid) ON UPDATE RESTRICT ON DELETE SET NULL;

DELETE FROM utentes.version;
"
pg_dump -a -b -n utentes --column-inserts -h localhost -p 9001 -U postgres -d 210825_bck_arazambeze > from_arazambeze_to_aracentro.sql
$PSQL -h localhost -p 9001 -U postgres -d "aracentro" -f from_arazambeze_to_aracentro.sql

python "${IETL_REPO}/postgres/serial_columns.py" localhost 9001 postgres test_aracentronorte --schema utentes --compare 'postgresql://postgres@localhost:9001/test_aranorte'

$PSQL -h localhost -U postgres -d "test_aranorte" -c "
UPDATE utentes.actividades SET gid =
UPDATE utentes.actividades_cultivos SET gid =
-- UPDATE utentes.documentos SET gid = ;
-- UPDATE utentes.facturacao SET gid = ;
UPDATE utentes.fontes SET gid =
UPDATE utentes.licencias SET gid =
-- UPDATE utentes.renovacoes SET gid = ;
UPDATE utentes.utentes SET gid =
-- DELETE FROM utentes.users WHERE username IN ();
-- UPDATE utentes.users SET id = ;


UPDATE utentes.exploracaos SET gid =


DELETE FROM utentes.version;
"
pg_dump -a -b -n utentes --column-inserts -h localhost -p 9001 -U postgres -d test_aranorte > from_aranorte_to_aracentronorte.sql
pg_dump -a -b -n inventario --column-inserts -h localhost -p 9001 -U postgres -d test_aranorte > from_inventario_aranorte_to_aracentronorte.sql
$PSQL -h localhost -p 9001 -U postgres -d test_aracentronorte -f from_aranorte_to_aracentronorte.sql
$PSQL -h localhost -p 9001 -U postgres -d test_aracentronorte -f from_inventario_aranorte_to_aracentronorte.sql

# for i in arazambeze aracentro aracentronorte arasul aranorte ; do dump_db "test_${i}" wip  || break ; done
