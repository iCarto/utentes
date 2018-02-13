#!/bin/bash

# DATABASE = $1
# DATA_VERSION = $2
SQITCH_TAG='@20170503'

SUCCESS=0
TODAY=$(date +%y%m%d)
PSQL="psql -X -q -v ON_ERROR_STOP=1 --pset pager=off"
PGDUMP="/usr/lib/postgresql/9.5/bin/pg_dump"

foo() {
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f acuiferos.sql.$2
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f fontes.sql.$2
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f barragens.sql.$2
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f estacoes.sql.$2
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f inventario_alfanumerico.sql.$2
}

dump() {
    BACKUP_FOLDER=/tmp/${TODAY}
    mkdir -p $BACKUP_FOLDER
    [ $FLAG_DUMP -eq 1 ] && ${PGDUMP} -h localhost -U postgres -C -E UTF-8 -f ${BACKUP_FOLDER}/${TODAY}_BDD_${1}.backup -Fc -O -x -Z 9 ${1}
}

fill_data() {
    DATABASE="$1"
    BACKUP_INVENTARIO="./datos/${2}_${1}_inventario.backup"
    BACKUP_UTENTES="./datos/${3}_${1}_utentes"

    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${DATABASE}" -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings;"
    # clean_data_inventario "${DATABASE}"

    # --jobs 2 # No compatible con --single-transaction
    # En lugar de disable-triggers estaria bien poder hacer un SET ALL CONSTRAINTS DEFERRED, para dar más seguridad a que
    # la migración va como debe. El disable triggers es porque si hay claves foráneas pg_restore no lo gestiona y puede intentar
    # introducir datos de analise antes que datos de fuente y se produce un error
    # https://stackoverflow.com/questions/5359968/restore-postgresql-db-from-backup-without-foreign-key-constraint-issue
    # http://blog.fabianbecker.eu/pg_restore-and-foreign-key-constraints/
    if [ -f "${BACKUP_INVENTARIO}" ] ; then
        pg_restore -h localhost -U postgres -d "${DATABASE}" --data-only --single-transaction --exit-on-error --disable-triggers "${BACKUP_INVENTARIO}"
    fi

    if [ "${DATABASE}" = "dpmaip" ] ; then
        PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM domains.ara; INSERT INTO domains.ara VALUES ('ara', 'DPMAIP', 'DPMAIP', NULL, NULL, NULL); REFRESH MATERIALIZED VIEW domains.domains;"
    elif [ "${DATABASE}" = "arasul" ] ; then
        PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM domains.ara; INSERT INTO domains.ara VALUES ('ara', 'Sul', 'Sul', NULL, NULL, NULL); REFRESH MATERIALIZED VIEW domains.domains;"
    fi


    if [ -f "${BACKUP_UTENTES}.backup" ] ; then
        pg_restore -h localhost -U postgres -d "${DATABASE}" --data-only --single-transaction --exit-on-error --disable-triggers "${BACKUP_UTENTES}.backup"
    else
        PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f "${BACKUP_UTENTES}.sql"
    fi

}

# $1 = DATABASE
# $2 = TAG OR @HEAD
sqitch_deploy() {
    cd ..
    sqitch deploy db:pg://postgres:postgres@localhost:5432/$1 --to-change $2
    if ! [ "$?" -eq $SUCCESS ]; then
        echo 'Sqitch no ha finalizado correctamente'
        echo "$1, $2"
        echo "Saliendo"
        exit
    fi
    cd scripts
}

drop_all() {
    ${PSQL} -h localhost -U postgres -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname IN ('aranorte', 'aranorte_test', 'arasul', 'dpmaip');"
    dropdb -h localhost -U postgres arasul
    dropdb -h localhost -U postgres aranorte
    dropdb -h localhost -U postgres aranorte_test
    dropdb -h localhost -U postgres vacia
    dropdb -h localhost -U postgres dpmaip
    # USERS=("utentes" "sixhiara_owner" "elle_read" "elle_write" "cbase_read" "cbase_write" "inventario_read" "inventario_write" "inventario")
    USERS=()
    for user in ${USERS[@]} ; do
        dropuser --if-exists -h localhost -U postgres "${user}"
    done
}

clean_data_inventario() {
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -c "DO $$ DECLARE query text; BEGIN FOR query IN SELECT 'DELETE FROM ' || schemaname || '.' || tablename  from pg_tables where schemaname = 'inventario' LOOP EXECUTE query; END LOOP; END $$;"
}

for_each_database() {
    TEMPLATE=$1
    DATABASE=$2
    CBASE_VERSION=$3

    echo -e "\n\n\nWORKING IN ${DATABASE}\n\n\n"
    createdb -h localhost -U postgres -T "$TEMPLATE" -E UTF8 "${DATABASE}"

    if [[ ! -z "$CBASE_VERSION" ]] ; then
        PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./datos/cbase.sql.${CBASE_VERSION}
    fi
}

write_version_and_dump() {
    DATABASE=$1

    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${DATABASE}" -c "DELETE FROM utentes.version;INSERT INTO utentes.version (version) VALUES ('${TODAY}');"
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d "${DATABASE}" -c "DELETE FROM inventario.version;INSERT INTO inventario.version (version) VALUES ('${TODAY}');"
    dump $DATABASE
}

main() {
    drop_all

    DATABASE=vacia
    for_each_database "template0" "$DATABASE" ""

    sqitch_deploy $DATABASE $SQITCH_TAG

    DATABASE=aranorte
    CBASE_VERSION=20160916.Norte
    INVENTARIO_VERSION=171122
    UTENTES_VERSION=170926

    for_each_database "vacia" "$DATABASE" "$CBASE_VERSION"

    fill_data "${DATABASE}" $INVENTARIO_VERSION $UTENTES_VERSION
    # bash restore_pictures_from_backup.sh fotos_inventario_20160918.Norte.backup ${DATABASE}

    sqitch_deploy $DATABASE @HEAD
    write_version_and_dump "$DATABASE"



    DATABASE=aranorte_test
    INVENTARIO_VERSION="NONE"
    UTENTES_VERSION=170421

    for_each_database "aranorte" "$DATABASE" ""

    fill_data ${DATABASE} $INVENTARIO_VERSION $UTENTES_VERSION
    # sqitch_deploy $DATABASE @HEAD
    write_version_and_dump "$DATABASE"

    DATABASE=dpmaip
    INVENTARIO_VERSION="NONE"
    UTENTES_VERSION=170915

    for_each_database "vacia" "$DATABASE" ""

    sqitch_deploy $DATABASE @HEAD

    fill_data ${DATABASE} $INVENTARIO_VERSION $UTENTES_VERSION
    write_version_and_dump "$DATABASE"

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

    python database_patch.py

}

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
