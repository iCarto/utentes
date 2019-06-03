
set -x
. ./variables.ini

pg_dump -Fc -E UTF-8 -O -x -U ${PG_LOCAL_USER} -d arasul_prod -h ${PG_LOCAL_HOST} -p ${PG_LOCAL_PORT} -t "public.${TABLE_EXPLORACAOS_TMP}" -t "public.${TABLE_CULTIVOS_TMP}" -f ${TODAY}_cultivos_temp_tables.dump
scp ${TODAY}_cultivos_temp_tables.dump pegasus:${REMOTE_FOLDER}
scp /home/icarto/proyectos/sixhiara/bkp/arasul_190410.dump pegasus:${REMOTE_FOLDER}
scp load_cultivos_arasul_staging.sh pegasus:${REMOTE_FOLDER}
scp variables.ini pegasus:${REMOTE_FOLDER}
ssh ${REMOTE_HOST} "cd ${REMOTE_FOLDER}; vagrant rsync"
ssh ${REMOTE_HOST}

# cp /home/icarto/proyectos/sixhiara/bkp/arasul_190410.dump .

#cd ${REMOTE_FOLDER}
#vagrant ssh
#cd ${REMOTE_VAGRANT_DIR}
#. ./variables.ini

#$PSQL -h "${PG_REMOTE_HOST}" -p "${PG_REMOTE_PORT}" -U "${PG_REMOTE_USER}" -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname='${DBNAME}';"
#dropdb -h ${PG_REMOTE_HOST} -p ${PG_REMOTE_PORT} -U ${PG_REMOTE_USER} ${DBNAME}

#createdb -h ${PG_REMOTE_HOST} -p ${PG_REMOTE_PORT} -U ${PG_REMOTE_USER} ${DBNAME}
#pg_restore -h ${PG_REMOTE_HOST} -p ${PG_REMOTE_PORT} -d ${DBNAME} -U ${PG_REMOTE_USER} ${REMOTE_VAGRANT_DIR}/arasul_190410.dump
#pg_restore -h ${PG_REMOTE_HOST} -p ${PG_REMOTE_PORT} -d ${DBNAME} -U ${PG_REMOTE_USER} -t ${TABLE_EXPLORACAOS_TMP} -t ${TABLE_CULTIVOS_TMP}  ${REMOTE_VAGRANT_DIR}/${TODAY}_cultivos_temp_tables.dump
#chmod 766 load_cultivos_arasul_staging.sh
#./load_cultivos_arasul_staging.sh
#rm load_cultivos_arasul_staging.sh
#rm variables.ini