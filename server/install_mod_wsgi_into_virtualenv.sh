#!/bin/bash

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

# shellcheck source=variables.ini
source "${this_dir}"/variables.ini

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.6
#shellcheck disable=1094
source /usr/local/bin/virtualenvwrapper.sh

workon "${PROJECT_NAME}"
pip install mod_wsgi
