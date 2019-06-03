#!/bin/bash

# set -e

source ../../server/variables.ini


create_db_from_template() {
    local TEMPLATE="${1}"
    local DATABASE="${2}"
    $DROPDB -h localhost -U postgres --if-exists "${DATABASE}"
    $CREATEDB -h localhost -U postgres -T "${TEMPLATE}" "${DATABASE}"
}


create_db_from_template_and_dump() {
    local TEMPLATE="${1}"
    local DATABASE="${2}"
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    $PGDUMP -h localhost -U postgres -Fc -Z9 -E UTF-8 -f "${DATABASE}.dump" "${DATABASE}"
}


create_last_db() {
    local DATABASE="${1}"
    local DUMP="${2}"
    $DROPDB -h localhost -U postgres --if-exists "${DATABASE}"
    $CREATEDB -h localhost -U postgres "${DATABASE}"
    $PGRESTORE -h localhost -U postgres -d "${DATABASE}" "${DUMP}"
}


restore_inventario_from_backup() {
    local TEMPLATE="${1}"
    local DATABASE="${2}"
    local DUMP="${3}"
    $CREATEDB -h localhost -U postgres -T "${TEMPLATE}" "${DATABASE}"
    bash ../delete_inventario_data.sh "${DATABASE}"
    # pg_restore -a -l 181115_aranorte_inventario.dump > 181115_aranorte_inventario.dump.toc y editar el toc
    $PGRESTORE -U postgres -h localhost -d "${DATABASE}" --data-only --single-transaction --exit-on-error -L "${DUMP}.toc" "${DUMP}"
}


restore_utentes_from_backup() {
    local TEMPLATE="${1}"
    local DATABASE="${2}"
    local DUMP="${3}"
    $CREATEDB -h localhost -U postgres -T "${TEMPLATE}" "${DATABASE}"
    bash ../delete_inventario_data.sh "${DATABASE}"
    # pg_restore -a -l 190104_aranorte_utentes.dump > 190104_aranorte_utentes.dump.toc y editar el toc
    $PGRESTORE -U postgres -h localhost -d "${DATABASE}" --data-only --single-transaction --exit-on-error -L "${DUMP}.toc" "${DUMP}"
}

nuevos_utentes() {
    local TEMPLATE="${1}"
    local DATABASE="${2}"
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    # sqitch status --plan-file ${REPO}/sqitch.plan "db:pg://postgres:postgres@localhost:9001/${DATABASE}"
    sqitch deploy --to=alter_table_exploracaos_add_cadastro_uni "${DATABASE}"
    bash upload_arasul_data_4.sh 190401_aranorte/Exploracoes_ARAN_utf8.shp 190401_aranorte/190401_Utentes_ARAN_rev_mire.ods $DATABASE 190401_aranorte/metadata.json ARAN 110
    bash upload_arasul_data_4.sh ./190401_aranorte/Exploracoes_ARAN_utf8.shp "./190401_aranorte/190401_Utentes_ARAN_rev_mire.ods" "${DATABASE}" $METADATA_FILE ARAN
    # AJUSTES A MANO
}

actualizar_cbase_y_dominios() {
    local TEMPLATE="${1}"
    local DATABASE="${2}"
    local CBASE_SQL_DATA="${3}"
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    cd ${REPO}
    # sqitch status "db:pg://postgres:postgres@localhost:9001/${DATABASE}"
    sqitch deploy --to=alter_tables_inventario_domains_add_app "db:pg://postgres:postgres@localhost:9001/${DATABASE}"
    cd -
    $PSQL -h localhost -U postgres -d "${DATABASE}" -f "${CBASE_SQL_DATA}.sql"
    $PSQL -h localhost -U postgres -d "${DATABASE}" -f "${CBASE_SQL_DATA}_process.sql"
    cd ${REPO}
    sqitch deploy --to=rename_domain_tipo_rega_tipo_cult "db:pg://postgres:postgres@localhost:9001/${DATABASE}"
    cd -
}

actualizar_barragens() {
    local DATABASE="${1}"
    local SHP="${2}"
    shp2pgsql -s 32737 -c -g geom -D -W UTF-8 -N abort "${SHP}" public.tmp_barragens > ${DATABASE}_tmp_barragens.sql
    $PSQL -h localhost -U postgres -d "${DATABASE}" -f new_sql_data/${DATABASE}_tmp_barragens.sql
    $PSQL -h localhost -U postgres -d "${DATABASE}" -f new_sql_data/process_barragens.sql
}

upload_geoms() {
    local DATABASE="${1}"
    local SHP="${2}"
    table=$3
    $PSQL -h localhost -U postgres -d "${DATABASE}" -c "DROP TABLE IF EXISTS $table;"
    ENCODING="UTF-8"
    shp2pgsql -s 32737 -c -g geom -D -W ${ENCODING} -N insert "${SHP}"  "$table" | $PSQL -h localhost -U postgres -d "${DATABASE}"
}

upload_dbf() {
    local DATABASE="${1}"
    local SHP="${2}"
    table=$3
    $PSQL -h localhost -U postgres -d "${DATABASE}" -c "DROP TABLE IF EXISTS $table;"
    ENCODING="UTF-8"
    shp2pgsql -W ${ENCODING} -n "${SHP}" "$table" | $PSQL -h localhost -U postgres -d "${DATABASE}"
}

aranorte_ready() {
    DATABASE=181106_aranorte
    DUMP=full_base_dumps/181106_BDD_aranorte.backup.dump
    create_last_db "${DATABASE}" "${DUMP}"

    TEMPLATE=181106_aranorte
    DATABASE=181115_aranorte
    DUMP=dumps_for_updating/181115_aranorte_inventario.dump
    restore_inventario_from_backup "${TEMPLATE}" "${DATABASE}" "${DUMP}"

    TEMPLATE=181115_aranorte
    DATABASE=190104_aranorte
    DUMP=dumps_for_updating/190104_aranorte_utentes.dump
    restore_utentes_from_backup "${TEMPLATE}" "${DATABASE}" "${DUMP}"
    
    TEMPLATE=190104_aranorte
    DATABASE=190118_aranorte
    nuevos_utentes "${TEMPLATE}" "${DATABASE}"
    
    TEMPLATE=190118_aranorte
    DATABASE=190521_aranorte
    CBASE_SQL_DATA=new_sql_data/cbase_data_all
    actualizar_cbase_y_dominios "${TEMPLATE}" "${DATABASE}" "${DUMP}"
    
    TEMPLATE=190521_aranorte
    DATABASE=190522_aranorte
    BARRAGENS_SHP=../../../08_BD_Unica/02_BD_Tecnica/Barragens/1904_Barragens_ARA_Norte.shp
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    actualizar_barragens "${DATABASE}" "${BARRAGENS_SHP}"
    
    TEMPLATE=190522_aranorte
    DATABASE=190525_aranorte
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    cd $REPO
    sqitch deploy --to=elle_wizard_maps_190520 "db:pg://postgres:postgres@localhost:9001/${DATABASE}"
    cd -
    $PSQL -h localhost -U postgres -d "${DATABASE}" -f new_sql_data/bacias_representacion.sql
    
    TEMPLATE=190525_aranorte
    DATABASE=190526_aranorte
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    # Fotos de barragens introducidas
    
    # Aquí falta algún paso
    
    TEMPLATE=190527_aranorte
    DATABASE=190528_aranorte
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    cd $REPO
    sqitch deploy --to=fixes_elle_wizard_maps_190520 "db:pg://postgres:postgres@localhost:9001/${DATABASE}"
    cd -
}

arazambeze_ready() {
    DATABASE=190425_arazambeze
    DUMP=full_base_dumps/190425_BDD_arazambeze.dump
    create_last_db "${DATABASE}" "${DUMP}"
    
    TEMPLATE=190425_arazambeze
    DATABASE=190521_arazambeze
    CBASE_SQL_DATA=new_sql_data/cbase_data_all
    actualizar_cbase_y_dominios "${TEMPLATE}" "${DATABASE}" "${CBASE_SQL_DATA}"
    
    TEMPLATE=190521_arazambeze
    DATABASE=190525_arazambeze
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    cd $REPO
    sqitch deploy --to=elle_wizard_maps_190520 "db:pg://postgres:postgres@localhost:9001/${DATABASE}"
    cd -
    $PSQL -h localhost -U postgres -d "${DATABASE}" -f new_sql_data/bacias_representacion.sql
    
    # Aquí falta algún paso
    
    TEMPLATE=190527_arazambeze
    DATABASE=190528_arazambeze
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    cd $REPO
    sqitch deploy --to=fixes_elle_wizard_maps_190520 "db:pg://postgres:postgres@localhost:9001/${DATABASE}"
    cd -
    
}

arasul_ready() {
    TEMPLATE=bck_arasul_prod_190513
    DATABASE=190521_arasul
    CBASE_SQL_DATA=new_sql_data/cbase_data_all
    actualizar_cbase_y_dominios "${TEMPLATE}" "${DATABASE}" "${DUMP}"
    
    TEMPLATE=190521_arasul
    DATABASE=190522_arasul
    BARRAGENS_SHP=../../../08_BD_Unica/02_BD_Tecnica/Barragens/1904_Barragem_ARA_Sul.shp
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    actualizar_barragens "${DATABASE}" "${BARRAGENS_SHP}"
    
    FOLDER='/home/fpuga/development/sixhiara/utentes-bd/scripts/bddunica'
    FONTES_XLSX=/home/fpuga/development/sixhiara/08_BD_Unica/190524_BD_ARA_Sul_Fontes/190524_ARASul_Fontes_Anton.xlsx
    FONTES_SHP=../../../08_BD_Unica/190524_BD_ARA_Sul_Fontes/190524_ARAS_Fontes_Final_dados.shp
    python ../update-bdd/p.py "${FONTES_XLSX}" "${FONTES_XLSX}.metadata.json"
    WORKING_XLSX=/home/fpuga/development/sixhiara/08_BD_Unica/190524_BD_ARA_Sul_Fontes/working.ods
    ogr2ogr -f "ESRI Shapefile" "${FOLDER}/fontes/" "$WORKING_XLSX"  -lco ENCODING=UTF-8 --config OGR_ODS_HEADERS FORCE

    upload_geoms "${DATABASE}" "${FONTES_SHP}" tmp_fontes_geoms
    upload_dbf "${DATABASE}" ./fontes/Fontes_analise.dbf tmp_fontes_analise
    upload_dbf "${DATABASE}" ./fontes/Fontes_Carac_Hidro.dbf tmp_fontes_carac_hidro
    upload_dbf "${DATABASE}" ./fontes/Fontes_Final.dbf tmp_fontes_final
    upload_dbf "${DATABASE}" ./fontes/Fontes_Litologia.dbf tmp_fontes_litolia
    upload_dbf "${DATABASE}" ./fontes/Fontes_Quant_Agua.dbf tmp_fontes_quant_agua

    $PSQL -h localhost -U postgres -d "${DATABASE}" -f new_sql_data/process_fontes.sql
    $PSQL -h localhost -U postgres -d "${DATABASE}" -c "UPDATE inventario.fontes set loc_unidad = 'UGBI' where cadastro ='01F/ARA/MAR/BOQUI/16';"
    
    TEMPLATE=190522_arasul
    DATABASE=190525_arasul
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    cd $REPO
    sqitch deploy --to=elle_wizard_maps_190520 "db:pg://postgres:postgres@localhost:9001/${DATABASE}"
    cd -
    $PSQL -h localhost -U postgres -d "${DATABASE}" -f new_sql_data/bacias_representacion.sql
    
    TEMPLATE=190525_arasul
    DATABASE=190526_arasul
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    # Fotos de barragens introducidas
    
    # Aquí falta algún paso
    
    TEMPLATE=190527_arasul
    DATABASE=190528_arasul
    create_db_from_template "${TEMPLATE}" "${DATABASE}"
    cd $REPO
    sqitch deploy --to=fixes_elle_wizard_maps_190520 "db:pg://postgres:postgres@localhost:9001/${DATABASE}"
    cd -

}

REPO=/home/fpuga/development/sixhiara/utentes-bd

foo() {





echo 'foo'








}



