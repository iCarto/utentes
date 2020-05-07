#!/bin/bash

source variables.ini

from_source() {
    # En debian 9 (stretch) python 3.6 no está en los repos
    # https://github.com/pyenv/pyenv/wiki/Common-build-problems
    # https://docs.python.org/3/using/unix.html#building-python
    apt-get update && sudo apt-get upgrade -y
    #  libffi-dev liblzma-dev
    # python-openssl
    apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev

    # No se puede hacer sobre /vagrant. Seguramente es porque hace un hardlink
    # en algún momento del proceso y no es válido en una carpeta compartida
    cd /tmp
    wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
    tar xvf Python-3.6.9.tgz
    cd Python-3.6.9
    # --enabled-shared
    # https://github.com/pyenv/pyenv/wiki#how-to-build-cpython-with---enable-shared
    # https://github.com/pyenv/pyenv/issues/392
    ./configure --enable-optimizations --with-ensurepip=install --enable-shared
    make -j8
    make altinstall
    cd ..
    rm -rf Python-3.6.9.tgz
    rm -rf Python-3.6.9
    ldconfig -v
    cd /vagrant/server
}

from_apt() {
    # http://railslide.io/virtualenvwrapper-python3.html
    apt-get install -o Dpkg::Options::=--force-confnew -y python${PYTHON_VERSION} python3-pip
    # pip3 install --upgrade pip
    # hash -r pip # Workaround https://github.com/pypa/pip/issues/5240
}

# $1 system user used to create the project
# $2 absolute or relative path to the folder which is going to be used, if not exists will be created
# $3 name of the virtualenv

# from_apt
from_source
pip${PYTHON_VERSION} install virtualenvwrapper
sudo -u "${DEFAULT_USER}" -H "${SETTINGS}"/config_virtualenv_dotfiles.sh
