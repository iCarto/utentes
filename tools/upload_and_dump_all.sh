#!/bin/bash

set -e

source ../server/variables.ini
source db_utils.sh

SUCCESS=0

foo() {
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${1}" -f "acuiferos.sql.$2"
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${1}" -f "fontes.sql.$2"
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${1}" -f "barragens.sql.$2"
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${1}" -f "estacoes.sql.$2"
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${1}" -f "inventario_alfanumerico.sql.$2"
}

error() {
    echo "$1"
    exit 1
}

dump() {
    DBNAME=$1
    BACKUP_FOLDER=/tmp/${TODAY}
    mkdir -p "${BACKUP_FOLDER}"
    [[ "${FLAG_DUMP}" -eq 1 ]] && ${PGDUMP} -h localhost -U postgres -Fc -Z 9 -E UTF-8 -f "${BACKUP_FOLDER}/${TODAY}_BDD_${1}.backup" -O -x "${DBNAME}"
}

# $1 = DBNAME
# $2 = TAG OR @HEAD
sqitch_deploy() {
    cd .. || error 'ERROR: arrancando sqitch deploy'
    # --quiet
    sqitch deploy "db:pg://postgres:postgres@localhost:${PG_PORT}/${1}" --to-change "${2}"
    if ! [[ "$?" -eq "${SUCCESS}" ]]; then
        echo 'Sqitch no ha finalizado correctamente'
        echo "$1, $2"
        echo "Saliendo"
        exit "${EX_1}"
    fi
    cd scripts || error 'ERROR: finalizando sqitch deploy'
}

for_each_database() {
    TEMPLATE=$1
    DBNAME=$2
    CBASE_VERSION=$3

    echo -e "\n\n\nWORKING IN ${DBNAME}\n\n\n"
    ${PSQL} -h localhost -U postgres -d postgres -c "select pg_terminate_backend(pid) from pg_stat_activity where datname = '${DBNAME}';"
    ${DROPDB} -h localhost -U postgres --if-exists "${DBNAME}"
    ${CREATEDB} -h localhost -U postgres -T "${TEMPLATE}" -E UTF8 -O postgres "${DBNAME}"
    if [[ -n "${CBASE_VERSION}" ]]; then
        PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBNAME}" -f "./datos/cbase.sql.${CBASE_VERSION}"
    fi
}

fill_data() {
    # "${DBNAME}" "${INVENTARIO_VERSION}" "${UTENTES_VERSION}" "${INVENTARIO_FOTOS_VERSION}"
    DBNAME="$1"
    BACKUP_INVENTARIO="./datos/${2}_${1}_inventario.dump"
    BACKUP_UTENTES="./datos/${3}_${1}_utentes"
    BACKUP_FOTOS="./datos/${4}"

    # PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings; DELETE FROM utentes.users;"
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings;"
    # delete_all_data_in_schema "${DBNAME}" "inventario"

    # --jobs 2 # No compatible con --single-transaction
    # En lugar de disable-triggers estaria bien poder hacer un SET ALL CONSTRAINTS DEFERRED, para dar más seguridad a que
    # la migración va como debe. El disable triggers es porque si hay claves foráneas pg_restore no lo gestiona y puede intentar
    # introducir datos de analise antes que datos de fuente y se produce un error
    # https://stackoverflow.com/questions/5359968/restore-postgresql-db-from-backup-without-foreign-key-constraint-issue
    # http://blog.fabianbecker.eu/pg_restore-and-foreign-key-constraints/
    if [[ -f "${BACKUP_INVENTARIO}" ]]; then
        ${PGRESTORE} -h localhost -U postgres -d "${DBNAME}" --data-only --single-transaction --exit-on-error --disable-triggers "${BACKUP_INVENTARIO}"
    fi

    ARA_DOMAIN=""
    case "${DBNAME}" in
        'aranorte') ARA_DOMAIN='Norte' ;;
        'arazambeze') ARA_DOMAIN='Zambeze' ;;
        'dpmaip') ARA_DOMAIN='DPMAIP' ;;
        'arasul') ARA_DOMAIN='Sul' ;;
        *) ARA_DOMAIN='Sul' ;;
    esac
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "DELETE FROM domains.ara; INSERT INTO domains.ara VALUES ('ara', '${ARA_DOMAIN}', '${ARA_DOMAIN}', NULL, NULL, NULL); REFRESH MATERIALIZED VIEW domains.domains;"

    if [[ "${ARA_DOMAIN}" == 'Zambeze' ]]; then
        echo -e '\nGestionado caso especial: Zambeze'
        ${PGRESTORE} -h localhost -U postgres -d "${DBNAME}" --data-only --single-transaction --schema=utentes --exit-on-error --disable-triggers ./datos/181031_BDD_arazambeze_pro.dump
        ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "DELETE FROM utentes.users;"
    elif [[ "${ARA_DOMAIN}" == 'DPMAIP' ]]; then
        echo -e '\nGestionado caso especial: dpmaip'
        ${PGRESTORE} -h localhost -U postgres -d "${DBNAME}" --data-only --single-transaction --exit-on-error --disable-triggers ./datos/180711_BDD_dpmaip_pro.dump
    else
        if [[ -f "${BACKUP_UTENTES}.dump" ]]; then
            ${PGRESTORE} -h localhost -U postgres -d "${DBNAME}" --data-only --single-transaction --exit-on-error --disable-triggers "${BACKUP_UTENTES}.dump"
        else
            PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${1}" -f "${BACKUP_UTENTES}.sql"
        fi
    fi

    if [[ -f "${BACKUP_FOTOS}" ]]; then
        echo "Restoring photos from specific dump"
        bash restore_pictures_from_backup.sh "${BACKUP_FOTOS}" "${DBNAME}"
    fi
}

fill_from_last_version() {
    DBNAME=$1
    BACKUP_LAST_VERSION="./datos/last_version/${2}_BDD_${DBNAME}.backup"

    sqitch_deploy "${DBNAME}" "@${2}" # Workaround
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "DELETE FROM utentes.utentes; DELETE FROM utentes.settings; DELETE FROM utentes.users;"
    ${PGRESTORE} -h localhost -U postgres -d "${DBNAME}" --data-only --single-transaction --exit-on-error --disable-triggers --schema=cbase --schema=inventario --schema=utentes "${BACKUP_LAST_VERSION}"
}

write_version_and_dump() {
    DBNAME=$1
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "DELETE FROM utentes.version;INSERT INTO utentes.version (version) VALUES ('${TODAY}');"
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "DELETE FROM inventario.version;INSERT INTO inventario.version (version) VALUES ('${TODAY}');"
    dump "${DBNAME}"
}

aranorte() {
    DBNAME=aranorte

    # LAST_VERSION=20180525

    if [[ -n "${LAST_VERSION}" ]]; then
        CBASE_VERSION=""
        for_each_database "vacia" "${DBNAME}" "${CBASE_VERSION}"
        fill_from_last_version "${DBNAME}" "${LAST_VERSION}"
    else
        CBASE_VERSION=20160916.Norte
        INVENTARIO_VERSION=181115
        UTENTES_VERSION=190104
        # Comentar esta línea si no es necesario procesar las fotos desde un dump aparte
        # INVENTARIO_FOTOS_VERSION=180314_aranorte_inventario2.backup
        INVENTARIO_FOTOS_VERSION=''
        for_each_database "vacia" "${DBNAME}" "${CBASE_VERSION}"
        sqitch_deploy "${DBNAME}" endereco_in_two_lines
        fill_data "${DBNAME}" "${INVENTARIO_VERSION}" "${UTENTES_VERSION}" "${INVENTARIO_FOTOS_VERSION}"
    fi

    # No actualizamos a HEAD porque la versión instalada es esta
    sqitch_deploy "${DBNAME}" endereco_in_two_lines

    # Escribimos la versión de hoy 190124, pero el sqitch está en: endereco_in_two_lines
    write_version_and_dump "${DBNAME}"
    echo 'finish aranorte'
}

arasul() {
    DBNAME=arasul
    SUR_DATA_VERSION=20170417.Sul

    for_each_database "vacia" "${DBNAME}" "${SUR_DATA_VERSION}"

    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBNAME}" -f ./populate_ara_sul_inventario_domains.sql
    foo "${DBNAME}" "${SUR_DATA_VERSION}"
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "DELETE FROM elle._map; DELETE FROM elle._map_overview; DELETE FROM elle._map_overview_style; DELETE FROM elle._map_style;"
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBNAME}" -f ./sixhiara_ARA_Sul_Mapa.sql
    bash restore_pictures_from_backup.sh fotos_inventario_20170417.Sul.backup "${DBNAME}"

    sqitch_deploy "${DBNAME}" @HEAD
    cd ./bdd-arasul-3/
    bash upload_arasul_data.sh
    cd ..
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "DELETE FROM domains.ara; INSERT INTO domains.ara VALUES ('ara', 'Sul', 'Sul', NULL, NULL, NULL); REFRESH MATERIALIZED VIEW domains.domains;"
    write_version_and_dump "${DBNAME}"
}

arazambeze() {
    DBNAME=arazambeze
    INVENTARIO_VERSION="NONE"
    UTENTES_VERSION=180711 # 180711_BDD_dpmaip_pro.dump
    CBASE_VERSION=""
    FOTOS_VERSION=""

    for_each_database "${DB_TEMPLATE}" "${DBNAME}" "${CBASE_VERSION}"
    sqitch_deploy "${DBNAME}" @20180525
    fill_data "${DBNAME}" "${INVENTARIO_VERSION}" "${UTENTES_VERSION}" "${FOTOS_VERSION}"
    sqitch_deploy "${DBNAME}" @HEAD

    # Temporal
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "
        UPDATE utentes.exploracaos SET exp_id = replace(exp_id, 'ARAS', 'ARAZ');
        UPDATE utentes.licencias SET lic_nro = replace(lic_nro, 'ARAS', 'ARAZ');
        UPDATE utentes.actividades_tanques_piscicolas SET tanque_id = replace(tanque_id, 'ARAS', 'ARAZ');
        update utentes.exploracaos e set loc_provin = u.loc_provin, loc_distri = u.loc_distri, loc_posto = u.loc_posto, loc_nucleo = u.loc_nucleo from utentes.utentes u where e.utente = u.gid;
        "
    PGOPTIONS='--client-min-messages=warning' ${PSQL} -h localhost -U postgres -d "${DBNAME}" -c "REFRESH MATERIALIZED VIEW domains.domains;"

    write_version_and_dump "${DBNAME}"
}

main() {
    PGOPTIONS_BCK="${PGOPTIONS}"
    export PGOPTIONS='--client-min-messages=warning'

    # Cuando está presente permite agrupar ciertos tareas en un template
    # común para que sea un poco más rápido el proceso
    LAST_COMMON_SQITCH_TAG="@dpmaip20170906"
    if [[ -n "${LAST_COMMON_SQITCH_TAG}" ]]; then
        DBNAME=vacia
        CBASE_VERSION=""
        for_each_database "${DB_TEMPLATE}" "${DBNAME}" "${CBASE_VERSION}"
        sqitch_deploy "${DBNAME}" "${LAST_COMMON_SQITCH_TAG}"
        DB_TEMPLATE='vacia'
    fi

    # SQITCH_TAG='@HEAD'

    aranorte
    # dpmaip
    # arazambeze

    # arasul

    # python database_patch.py
    export PGOPTIONS="${PGOPTIONS_BCK}"
    echo 'ACABO SIN ERRORES'
}

DB_TEMPLATE='template0'
FLAG_DUMP=0
# Process input arguments
while [[ $# -gt 0 ]]; do
    case $1 in

        --dump)
            FLAG_DUMP=1
            shift
            ;;
        *)
            echo "ERROR: Opción no reconocida"
            exit 1
            ;;

    esac
done

main
