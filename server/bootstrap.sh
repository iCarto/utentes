#!/bin/bash

set -e

# FIX ME
# DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# cd "${DIR}"
cd /vagrant/server

source ./variables.ini

# https://serverfault.com/questions/500764/
# https://unix.stackexchange.com/questions/22820
# https://unix.stackexchange.com/questions/146283/
# Take care DEBIAN_FRONTEND and -o Dpkg::Options::=--force-confnew can
# set not desired configurations. Maybe set it in each needed call will be
# better
export DEBIAN_FRONTEND=noninteractive
export UCF_FORCE_CONFFNEW=1

apt-get update

# https://www.tecmint.com/disable-lock-blacklist-package-updates-ubuntu-debian-apt/
apt-mark hold '^grub*'

# ./fix_locales_en.sh
# ./fix_locales_es.sh
# ./fix_locales_pt.sh
./fix_locales.sh

./disable_not_needed_services.sh

sed -i 's%.*history-search-backward%"\\e[5~": history-search-backward%' /etc/inputrc
sed -i 's%.*history-search-forward%"\\e[6~": history-search-forward%' /etc/inputrc

apt-get install -y emacs-nox build-essential unzip binutils libproj-dev gdal-bin python-gdal

./install_postgres.sh
./install_pgtap.sh
./install_sqitch.sh
./install_git.sh

./create_python_virtualenv_project.sh
./install_apache.sh # Los .conf hay que ajustarlos a mano

# ./install_nginx_y_visor.sh

./own_settings.sh

apt-get upgrade -y

apt-get autoremove -y
apt-get autoclean -y

# Workaround
systemctl restart apache2

is_installed() {
    if dpkg -s "${1}" > /dev/null 2>&1; then
        echo "is installed"
    fi
}
