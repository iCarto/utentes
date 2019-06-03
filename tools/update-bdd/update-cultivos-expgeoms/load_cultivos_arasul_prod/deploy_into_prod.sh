
set -x
. ./variables.ini

pg_dump -Fc -E UTF-8 -O -x -U ${PG_LOCAL_USER} -d arasul_prod -h ${PG_LOCAL_HOST} -p ${PG_LOCAL_PORT} -t "public.${TABLE_EXPLORACAOS_TMP}" -t "public.${TABLE_CULTIVOS_TMP}" -f ${TODAY}_cultivos_temp_tables.dump
scp ${TODAY}_cultivos_temp_tables.dump ${REMOTE_HOST}:${REMOTE_FOLDER}
scp load_cultivos_arasul_prod.sh ${REMOTE_HOST}:${REMOTE_FOLDER}
scp variables.ini ${REMOTE_HOST}:${REMOTE_FOLDER}
ssh ${REMOTE_HOST}

#. ./variables.ini

# $PSQL -h "${PG_REMOTE_HOST}" -p "${PG_REMOTE_PORT}" -U "${PG_REMOTE_USER}" -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname='${DBNAME}';"

# backup de la anterior base de datos, para poder comprobar cosas contra versiones antiguas
# createdb -h ${PG_REMOTE_HOST} -p ${PG_REMOTE_PORT} -U ${PG_REMOTE_USER} -T ${DBNAME} "${DBNAME}_tmp_${TODAY}"

#pg_restore -h ${PG_REMOTE_HOST} -p ${PG_REMOTE_PORT} -d arasul -U ${PG_REMOTE_USER} -t ${TABLE_EXPLORACAOS_TMP} -t ${TABLE_CULTIVOS_TMP} ${TODAY}_cultivos_temp_tables.dump
#chmod 766 load_cultivos_arasul_prod.sh
#./load_cultivos_arasul_prod.sh
#rm load_cultivos_arasul_prod.sh
#rm variables.ini