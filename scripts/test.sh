#!/bin/bash
# set -e: stops the script on error
# set -u: stops the script on unset variables
# set -o pipefail:  fail the whole pipeline on first error
set -euo pipefail

(
    cd back
    python -Wd -m unittest discover --failfast -s utentes.tests
)
