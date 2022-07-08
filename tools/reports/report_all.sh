#!/bin/bash
# set -e: stops the script on error
# set -u: stops the script on unset variables
# set -o pipefail:  fail the whole pipeline on first error
set -euo pipefail

BASE_REPORT_FOLDER=/tmp/$(date '+%y%m%d')

rm -rf "${BASE_REPORT_FOLDER}"

bash scripts/reports/cloc_report.sh "${BASE_REPORT_FOLDER}"
bash scripts/reports/schemaspy.sh "${BASE_REPORT_FOLDER}"
