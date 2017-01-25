#!/bin/bash

TODAY=`date +%y%m%d`
PSQL="psql -X -q -v ON_ERROR_STOP=1 --pset pager=off"
PGDUMP="/usr/lib/postgresql/9.5/bin/pg_dump"


DATABASE=aranorte
NORTE_DATA_VERSION=20160916.Norte


PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f cbase.sql.$NORTE_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f acuiferos.sql.$NORTE_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f fontes.sql.$NORTE_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f barragens.sql.$NORTE_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f estacoes.sql.$NORTE_DATA_VERSION
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f inventario_alfanumerico.sql.$NORTE_DATA_VERSION

OPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings;"
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./sixhiara_BDD_ARA_revision_161026.sql

bash restore_pictures_from_backup.sh fotos_inventario_20160918.backup

# Eliminar esta linea al recrear los datos base
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "UPDATE utentes.licencias SET taxa_fixa = 0 WHERE taxa_fixa IS NULL AND estado NOT IN ('Irregular', 'Não aprovada', 'Pendente de solicitação do utente', 'Pendente de revisão da solicitação (Direcção)', 'Pendente de revisão da solicitação (Chefe DT)', 'Pendente de revisão da solicitação (D. Jurídico)', 'Pendente de aprovação técnica (R. Cadastro)'); UPDATE utentes.licencias SET taxa_uso = 0 WHERE taxa_uso IS NULL AND estado NOT IN ('Irregular', 'Não aprovada', 'Pendente de solicitação do utente', 'Pendente de revisão da solicitação (Direcção)', 'Pendente de revisão da solicitação (Chefe DT)', 'Pendente de revisão da solicitação (D. Jurídico)', 'Pendente de aprovação técnica (R. Cadastro)');"


${PGDUMP} -h localhost -U postgres -C -E UTF-8 -f /tmp/${TODAY}_sixhiara_BDD_ARA_revision.backup -Fc -O -x -Z 9 ${DATABASE}

exit

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


