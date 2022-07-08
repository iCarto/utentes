#!/bin/bash

source ../../server/variables.ini

DOCUMENTOS_PATH="/var/www/media/documentos"
UPLOADS_PATH="/var/www/media/uploads"
QUERY="select concat(gid, ';', '${DOCUMENTOS_PATH}', '/', exploracao, '/', departamento,'/', name) from utentes.documentos where saved = false"

psql_c -d "${DBNAME}" -c "${QUERY}" > documentos_to_move.txt
sed -i '1,2d' documentos_to_move.txt
sed -i -n -e :a -e '1,2!{P;N;D;};N;ba' documentos_to_move.txt
documentos_moved=()
while read documento; do
    documento_gid="${documento%%;*}"
    documento="${documento##*;}"
    echo "${documento}"
    if [[ -e "${documento}" ]]; then
        echo "  >> Found in DOCUMENTOS"
    else
        echo "  >> !! Not found in DOCUMENTOS"
        documento_in_uploads="${UPLOADS_PATH}/None/${documento##*/}"
        if [[ -e ${documento_in_uploads} ]]; then
            echo "  >> Found in UPLOADS"
            documento_path="${documento%/*}"
            sudo mkdir --parents "${documento_path}"
            sudo cp "${documento_in_uploads}" "${documento}"
            if [[ $? -eq 0 ]]; then
                echo "    >> MOVED from ${documento_in_uploads} to ${documento}"
                documentos_moved=("${documentos_moved[@]}" "${documento_gid}")
            else
                echo "    >> FAIL COPYING FILE from ${documento_in_uploads} to ${documento}"
            fi
        else
            echo "  >> !! Not found in UPLOADS"
            echo "  !!!! FILE NOT FOUND"
        fi
    fi
done < documentos_to_move.txt
if [ ${#documentos_moved[@]} -ne 0 ]; then
    documentos_moved_for_query=$(
        IFS=,
        echo "${documentos_moved[*]}"
    )
    UPDATE_QUERY="update utentes.documentos set saved = true where gid in (${documentos_moved_for_query})"
    psql_c -d "${DBNAME}" -c "${UPDATE_QUERY}"
    echo "Updating 'saved' column in documentos: ${documentos_moved_for_query}"
fi
