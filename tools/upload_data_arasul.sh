#!/bin/bash

# TODAY=`date +%Y%m%d`
TODAY=20160908

DATABASE=arasul

PSQL="psql -X -q -v ON_ERROR_STOP=1 --pset pager=off"

PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f cbase.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./populate_ara_sul_domains.sql
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f acuiferos.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f fontes.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f barragens.sql.$TODAY
PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f estacoes.sql.$TODAY
# PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f inventario_alfanumerico.sql.$TODAY


