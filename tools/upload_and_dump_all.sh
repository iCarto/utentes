#!/bin/bash

TODAY=`date +%y%m%d`
PSQL="psql -X -q -v ON_ERROR_STOP=1 --pset pager=off"
PGDUMP="/usr/lib/postgresql/9.5/bin/pg_dump"


${PSQL] -h localhost -U postgres -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname IN ('aranorte', 'aranorte_test', 'arasul');"
dropdb -h localhost -U postgres arasul
dropdb -h localhost -U postgres aranorte
dropdb -h localhost -U postgres aranorte_test
dropuser -h localhost -U postgres utentes
dropuser -h localhost -U postgres sixhiara_owner
dropuser -h localhost -U postgres elle_read
dropuser -h localhost -U postgres elle_write
dropuser -h localhost -U postgres cbase_read
dropuser -h localhost -U postgres cbase_write
dropuser -h localhost -U postgres inventario_read
dropuser -h localhost -U postgres inventario_write
dropuser -h localhost -U postgres inventario



DATABASE=aranorte
NORTE_DATA_VERSION=20160916.Norte

createdb -h localhost -U postgres -T template0 -E UTF8 ${DATABASE}
cd ..
sqitch deploy
cd scripts
createdb -h localhost -U postgres -T aranorte arasul


PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f cbase.sql.$NORTE_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f acuiferos.sql.$NORTE_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f fontes.sql.$NORTE_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f barragens.sql.$NORTE_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f estacoes.sql.$NORTE_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f inventario_alfanumerico.sql.$NORTE_DATA_VERSION

OPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings;"
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./datos/170127_aranorte_reales.sql

bash restore_pictures_from_backup.sh fotos_inventario_20160918.backup

${PGDUMP} -h localhost -U postgres -C -E UTF-8 -f /tmp/${TODAY}_sixhiara_BDD_ARA_revision.backup -Fc -O -x -Z 9 ${DATABASE}


DATABASE=aranorte_test
createdb -h localhost -U postgres -T aranorte ${DATABASE}

OPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings;"
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./sixhiara_BDD_Testeo_160913.sql

# Eliminar esta linea al recrear los datos base
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "UPDATE utentes.licencias SET taxa_fixa = 0 WHERE taxa_fixa IS NULL AND estado NOT IN ('Irregular', 'Não aprovada', 'Pendente de solicitação do utente', 'Pendente de revisão da solicitação (Direcção)', 'Pendente de revisão da solicitação (Chefe DT)', 'Pendente de revisão da solicitação (D. Jurídico)', 'Pendente de aprovação técnica (R. Cadastro)'); UPDATE utentes.licencias SET taxa_uso = 0 WHERE taxa_uso IS NULL AND estado NOT IN ('Irregular', 'Não aprovada', 'Pendente de solicitação do utente', 'Pendente de revisão da solicitação (Direcção)', 'Pendente de revisão da solicitação (Chefe DT)', 'Pendente de revisão da solicitação (D. Jurídico)', 'Pendente de aprovação técnica (R. Cadastro)');"

${PGDUMP} -h localhost -U postgres -C -E UTF-8 -f /tmp/${TODAY}_sixhiara_BDD_Testeo.backup -Fc -O -x -Z 9 ${DATABASE}




DATABASE=arasul
SUR_DATA_VERSION=20160915.Sul

PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f cbase.sql.$SUR_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./populate_ara_sul_domains.sql
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f acuiferos.sql.$SUR_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f fontes.sql.$SUR_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f barragens.sql.$SUR_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f estacoes.sql.$SUR_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM elle._map; DELETE FROM elle._map_overview; DELETE FROM elle._map_overview_style; DELETE FROM elle._map_style;"
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./sixhiara_ARA_Sul_Mapa.sql


${PGDUMP} -h localhost -U postgres -C -E UTF-8 -f /tmp/${TODAY}_arasul.backup -Fc -O -x -Z 9 ${DATABASE}


