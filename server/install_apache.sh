#!/bin/bash

source variables.ini

from_apt() {
    if [[ "${PYTHON_VERSION}" == "2.7" ]]; then
        # mod-wsgi for python 2.7
        apt-get install -y apache2 apache2-mpm-prefork apache2-utils ssl-cert libapache2-mod-wsgi
    else
        # https://devops.profitbricks.com/tutorials/install-and-configure-mod_wsgi-on-ubuntu-1604-1/
        apt-get install -y apache2 apache2-utils libexpat1 ssl-cert python libapache2-mod-wsgi-py3
    fi
}

from_source() {
    # mod_wsgi should be compiled with the same version that the python to be
    # used. pip insall mod_wsgi compiles it, the we move it to apache folders
    # this can be improved
    # https://github.com/GrahamDumpleton/mod_wsgi
    apt-get install -y apache2 apache2-dev apache2-utils libexpat1 ssl-cert
    sudo -u vagrant -H -i "${SETTINGS}"/install_mod_wsgi_into_virtualenv.sh
    /home/vagrant/.virtualenvs/utentes/bin/python /home/vagrant/.virtualenvs/utentes/bin/mod_wsgi-express install-module
}

# from_apt
from_source
usermod -a -G www-data $DEFAULT_USER
mkdir -p $WWW_PATH
chown -R $DEFAULT_USER:www-data $WWW_PATH

# sudo $DEFAULT_USER
# git clone $GIT_REPO ${WWW_PATH}/${PROJECT_NAME}
# cd ${WWW_PATH}/${PROJECT_NAME}
# python setup.py install
# exit

if [[ ${ENTORNO} == "DEV" ]]; then
    cp ${SETTINGS}/apache-settings/${PROJECT_NAME}-test.conf /etc/apache2/sites-available/${PROJECT_NAME}.conf
    # cp ${SETTINGS}/apache-settings/${PROJECT_NAME}-ssl-test.conf /etc/apache2/sites-available/${PROJECT_NAME}-ssl.conf
else
    cp ${SETTINGS}/apache-settings/${PROJECT_NAME}.conf /etc/apache2/sites-available/
    cp ${SETTINGS}/apache-settings/${PROJECT_NAME}-ssl.conf /etc/apache2/sites-available/
fi

a2enmod deflate

a2enmod ssl
a2ensite ${PROJECT_NAME}
# a2ensite ${PROJECT_NAME}-ssl
a2dissite 000-default

# /etc/init.d/apache2 restart
if lsb_release --codename | grep "precise" > /dev/null; then
    service apache2 reload
else
    systemctl reload apache2
fi
