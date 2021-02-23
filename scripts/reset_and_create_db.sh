#!/bin/bash

# set -e: stops the script on error
# set -u: stops the script on unset variables
# set -o pipefail:  fail the whole pipeline on first error
# set -euo pipefail

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

source "${this_dir}/../tools/db_utils.sh"

BASE_DB_BACKUP_DIR="${this_dir}/../../bck-sirha/"

VERSION=$(date '+%y%m%d')
PRE=false
POST=false
BCK=false
ALL=false

while [[ "${#}" -gt 0 ]]; do
    case "${1}" in
        --pre)
            PRE=true
            shift
            ;;
        --post)
            POST=true
            shift
            ;;
        --bck)
            BCK=true
            shift
            ;;
        --all)
            ALL=true
            shift
            ;;
        --version)
            VERSION="${2}"
            shift
            shift
            ;;
        --dir)
            USER_BACKUP_FOLDER="${2}"
            shift
            shift
            ;;
        *)
            echo "Unknown option"
            exit 1
            ;;
    esac
done

aras="aranorte aracentro arasul"

my_create_last_db() {
    local database="${1}"
    local dump_file_path="${2}"
    local ara="${3}"
    if [[ -f "${dump_file_path}" ]]; then
        echo "Creating ${database} from file ${dump_file_path}"
        create_last_db "${database}" "${dump_file_path}"
        if [[ -n "${ara}" ]]; then
            echo "Creating test_${ara} from template ${database}"
            create_db_from_template "${database}" "test_${ara}"
        fi
    else
        echo "Skiping not existing file: '${dump_file_path}'"
    fi
}

create_all() {
    if [[ -z "${USER_BACKUP_FOLDER}" ]]; then
        echo "Options --dir and --all must be used toguether"
        exit 1
    fi
    for dump_file in "${USER_BACKUP_FOLDER}"/*.dump; do
        database=$(basename "${dump_file%.dump}")
        my_create_last_db "${database}" "${dump_file_path}"
        if echo "${database}" | grep -q '_post_'; then
            ara="${database%%_*}"
            my_create_last_db "${database}" "${dump_file_path}" "${ara}"
        fi
    done
}

create_some() {
    for ara in ${aras}; do
        if "${PRE}"; then
            database="${ara}_pre_${VERSION}"
            if [[ -n "${USER_BACKUP_FOLDER}" ]]; then
                BACKUP_FOLDER="${USER_BACKUP_FOLDER}"
            else
                BACKUP_FOLDER="${BASE_DB_BACKUP_DIR}/entregas/${VERSION}/"
            fi
            dump_file_path=$(realpath -m "${BACKUP_FOLDER}/${database}.dump")
            my_create_last_db "${database}" "${dump_file_path}"
        fi

        if "${POST}"; then
            database="${ara}_post_${VERSION}"
            if [[ -n "${USER_BACKUP_FOLDER}" ]]; then
                BACKUP_FOLDER="${USER_BACKUP_FOLDER}"
            else
                BACKUP_FOLDER="${BASE_DB_BACKUP_DIR}/entregas/${VERSION}/"
            fi
            dump_file_path=$(realpath "${BACKUP_FOLDER}/${database}.dump")
            my_create_last_db "${database}" "${dump_file_path}" "${ara}"
        fi

        if "${BCK}"; then
            database="${ara}_bck_${VERSION}"
            if [[ -n "${USER_BACKUP_FOLDER}" ]]; then
                BACKUP_FOLDER="${USER_BACKUP_FOLDER}"
            else
                BACKUP_FOLDER="${BASE_DB_BACKUP_DIR}/sirha_${ara}/backups/${VERSION}/"
            fi
            dump_file_path=$(realpath "${BACKUP_FOLDER}/${database}.dump")
            my_create_last_db "${database}" "${dump_file_path}"
        fi
    done
}

if "${ALL}"; then
    create_all
else
    create_some
fi
