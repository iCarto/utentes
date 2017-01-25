#!/bin/bash

# TODAY=`date +%Y%m%d`
PSQL="psql -X -q -v ON_ERROR_STOP=1 --pset pager=off"
PGDUMP="/usr/lib/postgresql/9.5/bin/pg_dump"


DATABASE=sixhiara

TODAY=20160916.Norte


PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f cbase.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f acuiferos.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f fontes.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f barragens.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f estacoes.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f inventario_alfanumerico.sql.$TODAY

OPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings;"
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./sixhiara_BDD_ARA_revision_161026.sql

bash restore_pictures_from_backup.sh fotos_inventario_20160918.backup

TODAY=`date +%Y%m%d`
${PGDUMP} -h localhost -U postgres -C -E UTF-8 -f /tmp/`date +%y%m%d`_sixhiara_BDD_ARA_revision.backup -Fc -O -x -Z 9 sixhiara


OPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings;"
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./sixhiara_BDD_Testeo_160913.sql

TODAY=`date +%Y%m%d`
${PGDUMP} -h localhost -U postgres -C -E UTF-8 -f /tmp/`date +%y%m%d`_sixhiara_BDD_Testeo.backup -Fc -O -x -Z 9 sixhiara




DATABASE=arasul
TODAY=20160915.Sul

PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f cbase.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./populate_ara_sul_domains.sql
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f acuiferos.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f fontes.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f barragens.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f estacoes.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM elle._map; DELETE FROM elle._map_overview; DELETE FROM elle._map_overview_style; DELETE FROM elle._map_style;"
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./sixhiara_ARA_Sul_Mapa.sql

TODAY=`date +%Y%m%d`
${PGDUMP} -h localhost -U postgres -C -E UTF-8 -f /tmp/arasul.${TODAY}.backup -Fc -O -x -Z 9 arasul


