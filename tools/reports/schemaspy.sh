#!/bin/bash
# set -e: stops the script on error
# set -u: stops the script on unset variables
# set -o pipefail:  fail the whole pipeline on first error
set -euo pipefail

if [[ -z "${1}" ]]; then
    echo "Introduzca el directorio para el reporte"
    exit 1
fi

REPORT_FOLDER="${1}/schemaspy"
mkdir -p "${REPORT_FOLDER}"

# especificar esquemas: https://schemaspy.readthedocs.io/en/latest/configuration/commandline.html#processing

docker run --network=host -v "${REPORT_FOLDER}:/output" schemaspy/schemaspy:6.1.0 -t pgsql -host localhost -port 9001 -db test_arasul -u postgres -p postgres -all -desc "Esquema de la base de datos del proyecto SIRH"
