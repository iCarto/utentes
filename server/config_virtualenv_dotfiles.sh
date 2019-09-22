#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source "${DIR}"/variables.ini

# source "$SETTINGS"/variables.ini

echo "VIRTUALENVWRAPPER_PYTHON=/usr/bin/python${PYTHON_VERSION}" >> ~/.bashrc
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python${PYTHON_VERSION}
source /usr/local/bin/virtualenvwrapper.sh

mkdir -p $WWW_PATH
mkvirtualenv -a $WWW_PATH $PROJECT_NAME

echo 'cdproject' >> ~/.virtualenvs/postactivate

workon $PROJECT_NAME
[ -f $WWW_PATH/requirements.txt ] && pip install -r $WWW_PATH/requirements.txt
