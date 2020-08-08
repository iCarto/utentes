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
    sudo -u "${DEFAULT_USER}" -H -i "${SETTINGS}"/install_mod_wsgi_into_virtualenv.sh
    "/home/${DEFAULT_USER}/.virtualenvs/${PROJECT_NAME}/bin/python" "/home/${DEFAULT_USER}/.virtualenvs/${PROJECT_NAME}/bin/mod_wsgi-express" install-module
}

from_where=${1:="from_apt"}
if [ "${from_where}" == "from_apt" ]; then
    from_apt
elif [ "${from_where}" == "from_source" ]; then
    from_source
else
    echo "Error de parámetro" && exit 1
fi

usermod -a -G www-data "${DEFAULT_USER}"
mkdir -p "${WWW_PATH}"
chown -R "${DEFAULT_USER}":www-data "${WWW_PATH}"

mkdir -p /var/www/media
chown -R "${DEFAULT_USER}":www-data /var/www/media

# En producción clonar repo en "${WWW_PATH}"

a2enmod deflate
a2enmod ssl
a2dissite 000-default

if [[ ${ENTORNO} == "DEV" ]]; then
    cp "${SETTINGS}/apache-settings/${PROJECT_NAME}.conf.dev" "/etc/apache2/sites-available/${PROJECT_NAME}.conf"
    # cp ${SETTINGS}/apache-settings/${PROJECT_NAME}-ssl.conf.dev /etc/apache2/sites-available/${PROJECT_NAME}-ssl.conf
    a2ensite "${PROJECT_NAME}.conf"
    # a2ensite ${PROJECT_NAME}-ssl
else
    cp "${SETTINGS}/apache-settings/${PROJECT_NAME}.conf.prod" /etc/apache2/sites-available/
    cp "${SETTINGS}/apache-settings/${PROJECT_NAME}-ssl.conf.prod" /etc/apache2/sites-available/
    a2ensite "${PROJECT_NAME}"
    a2ensite "${PROJECT_NAME}-ssl"
fi

# /etc/init.d/apache2 restart
if lsb_release --codename | grep "precise" > /dev/null; then
    service apache2 reload
else
    systemctl restart apache2
fi
