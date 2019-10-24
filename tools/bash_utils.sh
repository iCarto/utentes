#!/bin/bash

# set -e  # Porqué si se lanza desde cli se cierra el terminal

source ../server/variables.ini
source exit_codes.sh

ensure_file_exists() {
    local FILE="${1}"
    if [ ! -f "${FILE}" ]; then
        echo "El fichero debe existir: ${FILE}"
        exit $EX_FILE
    fi
}

ensure_folder_exists() {
    local FILE="${1}"
    if [ ! -d "${FILE}" ]; then
        echo "El directorio debe existir: ${FILE}"
        exit $EX_FILE
    fi
}
