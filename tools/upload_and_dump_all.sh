#!/bin/bash

set -e

source ../server/variables.ini

SUCCESS=0
TODAY=$(date +%y%m%d)


foo() {
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${1}" -f "acuiferos.sql.$2"
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${1}" -f "fontes.sql.$2"
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${1}" -f "barragens.sql.$2"
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${1}" -f "estacoes.sql.$2"
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${1}" -f "inventario_alfanumerico.sql.$2"
}

error() {
    echo "$1"
    exit -1
}

dump() {
    DATABASE=$1
    BACKUP_FOLDER=/tmp/${TODAY}
    mkdir -p "${BACKUP_FOLDER}"
    [ "${FLAG_DUMP}" -eq 1 ] && ${PGDUMP} -h localhost -U postgres -Fc -Z 9 -E UTF-8 -f "${BACKUP_FOLDER}/${TODAY}_BDD_${1}.backup"  -O -x "${DATABASE}"
}


# $1 = DATABASE
# $2 = TAG OR @HEAD
sqitch_deploy() {
    cd .. || error 'ERROR: arrancando sqitch deploy'
    sqitch --quiet deploy db:pg://postgres:postgres@localhost:${PG_PORT}/$1 --to-change $2
    if ! [ "$?" -eq $SUCCESS ]; then
        echo 'Sqitch no ha finalizado correctamente'
        echo "$1, $2"
        echo "Saliendo"
        exit
    fi
    cd scripts || error 'ERROR: finalizando sqitch deploy'
}

clean_data_inventario() {
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -c "DO $$ DECLARE query text; BEGIN FOR query IN SELECT 'DELETE FROM ' || schemaname || '.' || tablename  from pg_tables where schemaname = 'inventario' LOOP EXECUTE query; END LOOP; END $$;"
}

for_each_database() {
    TEMPLATE=$1
    DATABASE=$2
    CBASE_VERSION=$3

    echo -e "\n\n\nWORKING IN ${DATABASE}\n\n\n"
    ${PSQL} -h localhost -U postgres -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname = '${DATABASE}';"
    $DROPDB -h localhost -U postgres --if-exists "${DATABASE}"
    $CREATEDB -h localhost -U postgres -T "$TEMPLATE" -E UTF8 -O postgres "${DATABASE}"
    if [[ ! -z "$CBASE_VERSION" ]] ; then
        PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${DATABASE}" -f "./datos/cbase.sql.${CBASE_VERSION}"
    fi
}

fill_data() {
    DATABASE="$1"
    BACKUP_INVENTARIO="./datos/${2}_${1}_inventario.backup"
    BACKUP_UTENTES="./datos/${3}_${1}_utentes"
    BACKUP_FOTOS="./datos/${4}"

    # PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${DATABASE}" -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings; DELETE FROM utentes.users;"
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${DATABASE}" -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings;"
    # clean_data_inventario "${DATABASE}"

    # --jobs 2 # No compatible con --single-transaction
    # En lugar de disable-triggers estaria bien poder hacer un SET ALL CONSTRAINTS DEFERRED, para dar más seguridad a que
    # la migración va como debe. El disable triggers es porque si hay claves foráneas pg_restore no lo gestiona y puede intentar
    # introducir datos de analise antes que datos de fuente y se produce un error
    # https://stackoverflow.com/questions/5359968/restore-postgresql-db-from-backup-without-foreign-key-constraint-issue
    # http://blog.fabianbecker.eu/pg_restore-and-foreign-key-constraints/
    if [ -f "${BACKUP_INVENTARIO}" ] ; then
        $PGRESTORE -h localhost -U postgres -d "${DATABASE}" --data-only --single-transaction --exit-on-error --disable-triggers "${BACKUP_INVENTARIO}"
    fi

    ARA_DOMAIN=""
    case "${DATABASE}" in
        'aranorte') ARA_DOMAIN='Norte';;
        'arasul') ARA_DOMAIN='Sul';;
        'arazambeze') ARA_DOMAIN='Zambeze';;
        'dpmaip') ARA_DOMAIN='DPMAIP';;
    esac
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${DATABASE}" -c "DELETE FROM domains.ara; INSERT INTO domains.ara VALUES ('ara', '$ARA_DOMAIN', '$ARA_DOMAIN', NULL, NULL, NULL); REFRESH MATERIALIZED VIEW domains.domains;"


    # if [ -f "${BACKUP_UTENTES}.backup" ] ; then
    #     $PGRESTORE -h localhost -U postgres -d "${DATABASE}" --data-only --single-transaction --exit-on-error --disable-triggers "${BACKUP_UTENTES}.backup"
    # else
    #     PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f "${BACKUP_UTENTES}.sql"
    # fi

    $PGRESTORE -h localhost -U postgres -d "${DATABASE}" --data-only --single-transaction --exit-on-error --disable-triggers ./datos/180711_BDD_dpmaip_pro.dump

    if [ -f "${BACKUP_FOTOS}" ]; then
        echo "********************************************"
        bash restore_pictures_from_backup.sh "${BACKUP_FOTOS}" "${DATABASE}"
    fi
}

fill_from_last_version() {
    DATABASE=$1
    BACKUP_LAST_VERSION=./datos/last_version/${2}_BDD_${DATABASE}.backup

    sqitch_deploy "${DATABASE}" "@${2}" # Workaround
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${DATABASE}" -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings; DELETE FROM utentes.users;"
    $PGRESTORE -h localhost -U postgres -d "${DATABASE}" --data-only --single-transaction --exit-on-error --disable-triggers --schema=cbase --schema=inventario --schema=utentes "${BACKUP_LAST_VERSION}"
}

write_version_and_dump() {
    DATABASE=$1

    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${DATABASE}" -c "DELETE FROM utentes.version;INSERT INTO utentes.version (version) VALUES ('${TODAY}');"
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${DATABASE}" -c "DELETE FROM inventario.version;INSERT INTO inventario.version (version) VALUES ('${TODAY}');"
    dump "${DATABASE}"
}

aranorte() {
    DATABASE=aranorte

    LAST_VERSION=20180525

    if [ ! -z $LAST_VERSION ]; then
        CBASE_VERSION=""
        for_each_database "vacia" "$DATABASE" "$CBASE_VERSION"
        fill_from_last_version "${DATABASE}" "${LAST_VERSION}"
    else
        CBASE_VERSION=20160916.Norte
        INVENTARIO_VERSION=171122
        UTENTES_VERSION=170926
        # Comentar esta línea si no es necesario procesar las fotos desde un dump aparte
        # INVENTARIO_FOTOS_VERSION=180314_aranorte_inventario2.backup
        for_each_database "vacia" "$DATABASE" "$CBASE_VERSION"
        fill_data "${DATABASE}" "${INVENTARIO_VERSION}" "${UTENTES_VERSION}" "${INVENTARIO_FOTOS_VERSION}"
    fi

    sqitch_deploy $DATABASE @HEAD

    # sqitch_deploy $DATABASE @HEAD # Workaround
    write_version_and_dump "$DATABASE"
}

dpmaip() {
    DATABASE=dpmaip
    INVENTARIO_VERSION="NONE"
    UTENTES_VERSION=180711 # 180711_BDD_dpmaip_pro.dump
    CBASE_VERSION=""
    FOTOS_VERSION=""


    for_each_database "${DB_TEMPLATE}" "${DATABASE}" "${CBASE_VERSION}"
    fill_data ${DATABASE} ${INVENTARIO_VERSION} ${UTENTES_VERSION} "${FOTOS_VERSION}"
    sqitch_deploy $DATABASE @HEAD

    # Temporal
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${DATABASE}" -c "
        UPDATE utentes.exploracaos SET exp_id = replace(exp_id, 'ARAN', 'DPMAIP');
        UPDATE utentes.licencias SET lic_nro = replace(lic_nro, 'ARAN', 'DPMAIP');
        "

    write_version_and_dump "$DATABASE"
}

arasul() {
    DATABASE=arasul
    SUR_DATA_VERSION=20170417.Sul

    for_each_database "vacia" "$DATABASE" "$SUR_DATA_VERSION"

    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./populate_ara_sul_domains.sql
    foo ${DATABASE} ${SUR_DATA_VERSION}
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM elle._map; DELETE FROM elle._map_overview; DELETE FROM elle._map_overview_style; DELETE FROM elle._map_style;"
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./sixhiara_ARA_Sul_Mapa.sql
    bash restore_pictures_from_backup.sh fotos_inventario_20170417.Sul.backup ${DATABASE}

    sqitch_deploy $DATABASE @HEAD
    cd ./bdd-arasul-3/
    bash upload_arasul_data.sh
    cd ..
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM domains.ara; INSERT INTO domains.ara VALUES ('ara', 'Sul', 'Sul', NULL, NULL, NULL); REFRESH MATERIALIZED VIEW domains.domains;"
    write_version_and_dump "$DATABASE"
}

main() {
    PGOPTIONS_BCK="${PGOPTIONS}"
    export PGOPTIONS='--client-min-messages=warning'

    # Cuando está presente permite agrupar ciertos tareas en un template
    # común para que sea un poco más rápido el proceso
    LAST_COMMON_SQITCH_TAG="@dpmaip20170906"
    if [ ! -z "${LAST_COMMON_SQITCH_TAG}" ]; then
        DATABASE=vacia
        CBASE_VERSION=""
        for_each_database "${DB_TEMPLATE}" "${DATABASE}" "${CBASE_VERSION}"
        sqitch_deploy "$DATABASE" "${LAST_COMMON_SQITCH_TAG}"
        DB_TEMPLATE='vacia'
    fi


    SQITCH_TAG='@HEAD'

    aranorte
    dpmaip

    # arasul

    # python database_patch.py
    export PGOPTIONS="${PGOPTIONS_BCK}"
}

DB_TEMPLATE='template0'
FLAG_DUMP=0
# Process input arguments
while [ $# -gt 0 ]; do
    case $1 in

    --dump)
        FLAG_DUMP=1
        shift
        ;;
    esac
done

main
