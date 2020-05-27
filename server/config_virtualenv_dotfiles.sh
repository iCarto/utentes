#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source "${DIR}"/variables.ini

# source "$SETTINGS"/variables.ini

_PYTHON_PATH=$(which "python${PYTHON_VERSION}")
echo "VIRTUALENVWRAPPER_PYTHON=${_PYTHON_PATH}" >> ~/.bashrc
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc

export VIRTUALENVWRAPPER_PYTHON=${_PYTHON_PATH}
source /usr/local/bin/virtualenvwrapper.sh

echo 'cdproject' >> ~/.virtualenvs/postactivate

sudo mkdir -p $WWW_PATH
mkvirtualenv -a $WWW_PATH $PROJECT_NAME

workon "${PROJECT_NAME}"
[ -f "${WWW_PATH}/requirements.txt" ] && pip install -r "${WWW_PATH}/requirements.txt"
[ -f "${WWW_PATH}/setup.py" ] && python setup.py install

# Don't remove. If scripts ends with because setup.py does not exists it
# returns a failure status and the caller could ends
echo "Virtualenv installed"
