#!/bin/bash

TODAY=`date +%y%m%d`
PSQL="psql -X -q -v ON_ERROR_STOP=1 --pset pager=off"
PGDUMP="/usr/lib/postgresql/9.5/bin/pg_dump"

# DATABASE = $1
# DATA_VERSION = $2
foo() {
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f cbase.sql.$2
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f acuiferos.sql.$2
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f fontes.sql.$2
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f barragens.sql.$2
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f estacoes.sql.$2
}



${PSQL} -h localhost -U postgres -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname IN ('aranorte', 'aranorte_test', 'arasul');"
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


foo ${DATABASE} ${NORTE_DATA_VERSION}
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f inventario_alfanumerico.sql.$NORTE_DATA_VERSION

OPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings;"
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./datos/170127_aranorte_reales.sql

bash restore_pictures_from_backup.sh fotos_inventario_20160918.Norte.backup ${DATABASE}

${PGDUMP} -h localhost -U postgres -C -E UTF-8 -f /tmp/${TODAY}_sixhiara_BDD_ARA_revision.backup -Fc -O -x -Z 9 ${DATABASE}


DATABASE=aranorte_test
createdb -h localhost -U postgres -T aranorte ${DATABASE}

OPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings;"
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./sixhiara_BDD_Testeo_160913.sql

# Eliminar esta linea al recrear los datos base
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "UPDATE utentes.licencias SET taxa_fixa = 0 WHERE taxa_fixa IS NULL AND estado NOT IN ('Irregular', 'Não aprovada', 'Pendente de solicitação do utente', 'Pendente de revisão da solicitação (Direcção)', 'Pendente de revisão da solicitação (Chefe DT)', 'Pendente de revisão da solicitação (D. Jurídico)', 'Pendente de aprovação técnica (R. Cadastro)'); UPDATE utentes.licencias SET taxa_uso = 0 WHERE taxa_uso IS NULL AND estado NOT IN ('Irregular', 'Não aprovada', 'Pendente de solicitação do utente', 'Pendente de revisão da solicitação (Direcção)', 'Pendente de revisão da solicitação (Chefe DT)', 'Pendente de revisão da solicitação (D. Jurídico)', 'Pendente de aprovação técnica (R. Cadastro)');"

${PGDUMP} -h localhost -U postgres -C -E UTF-8 -f /tmp/${TODAY}_sixhiara_BDD_Testeo.backup -Fc -O -x -Z 9 ${DATABASE}




DATABASE=arasul
SUR_DATA_VERSION=20170415.Sul

PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./populate_ara_sul_domains.sql
foo ${DATABASE} ${SUR_DATA_VERSION}
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM elle._map; DELETE FROM elle._map_overview; DELETE FROM elle._map_overview_style; DELETE FROM elle._map_style;"
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./sixhiara_ARA_Sul_Mapa.sql
bash restore_pictures_from_backup.sh fotos_inventario_170415.Sul.backup ${DATABASE}


${PGDUMP} -h localhost -U postgres -C -E UTF-8 -f /tmp/${TODAY}_arasul.backup -Fc -O -x -Z 9 ${DATABASE}


