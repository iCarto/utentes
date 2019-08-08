#!/bin/bash

# FIX ME
# DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# cd "${DIR}"
cd /vagrant/server

source ./variables.ini

apt-get update

# ./fix_locales.sh
sed -i "s/^# ${LOCALE} UTF-8/${LOCALE} UTF-8/" /etc/locale.gen
locale-gen
update-locale --reset LANG="${LOCALE}" LC_CTYPE="${LOCALE}"
export LANG="${LOCALE}"
export LC_TYPE="${LOCALE}"

./disable_not_needed_services.sh

sed -i 's%.*history-search-backward%"\\e[5~": history-search-backward%' /etc/inputrc
sed -i 's%.*history-search-forward%"\\e[6~": history-search-forward%' /etc/inputrc

apt-get install -y emacs-nox build-essential unzip binutils libproj-dev gdal-bin python-gdal

./install_postgres.sh
./install_pgtap.sh
./install_sqitch.sh
./install_git.sh

./create_python${PYTHON_VERSION}_virtualenv_project.sh
# ./install_apache.sh    # Los .conf hay que ajustarlos a mano

./install_nginx_y_visor.sh

./own_settings.sh

# https://www.tecmint.com/disable-lock-blacklist-package-updates-ubuntu-debian-apt/
apt-mark hold '^grub*'
apt-get upgrade -y

apt-get autoremove
apt-get autoclean

# Workaround
service apache2 restart
