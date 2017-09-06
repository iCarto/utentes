#!/bin/bash

# DATABASE = $1
# DATA_VERSION = $2
SQITCH_TAG='@20170503'

SUCCESS=0
TODAY=$(date +%y%m%d)
PSQL="psql -X -q -v ON_ERROR_STOP=1 --pset pager=off"
PGDUMP="/usr/lib/postgresql/9.5/bin/pg_dump"

foo() {
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f cbase.sql.$2
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f acuiferos.sql.$2
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f fontes.sql.$2
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f barragens.sql.$2
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f estacoes.sql.$2
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f inventario_alfanumerico.sql.$2
}

foo2() {
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings;"
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${1} -f ./datos/170421_${1}.sql
}

dump() {
    BACKUP_FOLDER=/tmp/${TODAY}
    mkdir -p $BACKUP_FOLDER
    [ $FLAG_DUMP -eq 1 ] && ${PGDUMP} -h localhost -U postgres -C -E UTF-8 -f ${BACKUP_FOLDER}/${TODAY}_BDD_${1}.backup -Fc -O -x -Z 9 ${1}
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

main() {
    ${PSQL} -h localhost -U postgres -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname IN ('aranorte', 'aranorte_test', 'arasul');"
    dropdb -h localhost -U postgres arasul
    dropdb -h localhost -U postgres aranorte
    dropdb -h localhost -U postgres aranorte_test
    dropdb -h localhost -U postgres vacia
    dropdb -h localhost -U postgres dpmaip
    dropuser -h localhost -U postgres utentes
    dropuser -h localhost -U postgres sixhiara_owner
    dropuser -h localhost -U postgres elle_read
    dropuser -h localhost -U postgres elle_write
    dropuser -h localhost -U postgres cbase_read
    dropuser -h localhost -U postgres cbase_write
    dropuser -h localhost -U postgres inventario_read
    dropuser -h localhost -U postgres inventario_write
    dropuser -h localhost -U postgres inventario

    DATABASE=vacia
    echo -e "\n\n\nWORKING IN ${DATABASE}\n\n\n"
    createdb -h localhost -U postgres -T template0 -E UTF8 ${DATABASE}
    sqitch_deploy $DATABASE $SQITCH_TAG

    DATABASE=aranorte
    echo -e "\n\n\nWORKING IN ${DATABASE}\n\n\n"
    NORTE_DATA_VERSION=20160916.Norte
    createdb -h localhost -U postgres -T vacia ${DATABASE}
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f cbase.sql.${NORTE_DATA_VERSION}
    # foo ${DATABASE} ${NORTE_DATA_VERSION}
    # PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABSE} -c "DO $$ DECLARE query text; BEGIN FOR query IN SELECT 'DELETE FROM ' || schemaname || '.' || tablename  from pg_tables where schemaname = 'inventario' LOOP EXECUTE query; END LOOP; END $$;"

    # En lugar de disable-triggers estaria bien poder hacer un SET ALL CONSTRAINTS DEFERRED, para dar más seguridad a que
    # la migración va como debe. El disable triggers es porque si hay claves foráneas pg_restore no lo gestiona y puede intentar
    # introducir datos de analise antes que datos de fuente y se produce un error
    # https://stackoverflow.com/questions/5359968/restore-postgresql-db-from-backup-without-foreign-key-constraint-issue
    # http://blog.fabianbecker.eu/pg_restore-and-foreign-key-constraints/
    pg_restore --disable-triggers -a --single-transaction -h localhost -U postgres -d ${DATABASE} ./datos/170421_backupinventario.backup
    foo2 ${DATABASE} ${NORTE_DATA_VERSION}
    # bash restore_pictures_from_backup.sh fotos_inventario_20160918.Norte.backup ${DATABASE}

    sqitch_deploy $DATABASE @HEAD
    dump $DATABASE

    DATABASE=aranorte_test
    echo -e "\n\n\nWORKING IN ${DATABASE}\n\n\n"
    createdb -h localhost -U postgres -T aranorte ${DATABASE}
    foo2 ${DATABASE} ${NORTE_DATA_VERSION}
    # sqitch_deploy $DATABASE @HEAD
    dump $DATABASE

    DATABASE=dpmaip
    echo -e "\n\n\nWORKING IN ${DATABASE}\n\n\n"
    createdb -h localhost -U postgres -T vacia ${DATABASE}
    sqitch_deploy $DATABASE @HEAD
    # foo2 ${DATABASE} ${NORTE_DATA_VERSION}
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings;"
    # PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./datos/170421_aranorte_test.sql
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM domains.ara; INSERT INTO domains.ara VALUES ('ara', 'DPMAIP', 'DPMAIP', NULL, NULL, NULL); REFRESH MATERIALIZED VIEW domains.domains;"
    dump $DATABASE

    DATABASE=arasul
    echo -e "\n\n\nWORKING IN ${DATABASE}\n\n\n"
    SUR_DATA_VERSION=20170417.Sul
    createdb -h localhost -U postgres -T vacia ${DATABASE}

    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./populate_ara_sul_domains.sql
    foo ${DATABASE} ${SUR_DATA_VERSION}
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM elle._map; DELETE FROM elle._map_overview; DELETE FROM elle._map_overview_style; DELETE FROM elle._map_style;"
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -f ./sixhiara_ARA_Sul_Mapa.sql
    bash restore_pictures_from_backup.sh fotos_inventario_20170417.Sul.backup ${DATABASE}

    sqitch_deploy $DATABASE @HEAD
    PGOPTIONS='--client-min-messages=warning' $PSQL -h localhost -U postgres -d ${DATABASE} -c "DELETE FROM domains.ara; INSERT INTO domains.ara VALUES ('ara', 'Sul', 'Sul', NULL, NULL, NULL); REFRESH MATERIALIZED VIEW domains.domains;"

    dump $DATABASE

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
