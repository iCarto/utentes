#!/bin/bash

source variables.ini

# $1 system user used to create the project
# $2 absolute or relative path to the folder which is going to be used, if not exists will be created
# $3 name of the virtualenv

# http://railslide.io/virtualenvwrapper-python3.html
apt-get install -y python${PYTHON_VERSION} python3-pip
pip3 install --upgrade pip
pip3 install virtualenvwrapper

sudo -u "${DEFAULT_USER}" -H "${SETTINGS}"/config_virtualenv_dotfiles.sh
