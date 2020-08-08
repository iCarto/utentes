#!/bin/bash

source variables.ini

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.6
#shellcheck disable=1094
source /usr/local/bin/virtualenvwrapper.sh

workon "${PROJECT_NAME}"
pip install mod_wsgi
