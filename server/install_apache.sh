#!/bin/bash

source variables.ini

if [[ "${PYTHON_VERSION}" == "2.7" ]]; then
    # mod-wsgi for python 2.7
    apt-get install -y apache2 apache2-utils ssl-cert libapache2-mod-wsgi
else
    # https://devops.profitbricks.com/tutorials/install-and-configure-mod_wsgi-on-ubuntu-1604-1/
    apt-get install -y apache2 apache2-utils libexpat1 ssl-cert python libapache2-mod-wsgi-py3
fi

usermod -a -G www-data $DEFAULT_USER
mkdir -p $WWW_PATH
chown -R $DEFAULT_USER:www-data $WWW_PATH

# sudo $DEFAULT_USER
# git clone $GIT_REPO ${WWW_PATH}/${PROJECT_NAME}
# cd ${WWW_PATH}/${PROJECT_NAME}
# python setup.py install
# exit

# cp ${SETTINGS}/apache-settings/${PROJECT_NAME}.conf /etc/apache2/sites-available/
# cp ${SETTINGS}/apache-settings/${PROJECT_NAME}-ssl.conf /etc/apache2/sites-available/

cp ${SETTINGS}/apache-settings/${PROJECT_NAME}-test.conf /etc/apache2/sites-available/${PROJECT_NAME}.conf
cp ${SETTINGS}/apache-settings/${PROJECT_NAME}-ssl-test.conf /etc/apache2/sites-available/${PROJECT_NAME}-ssl.conf

# cd ${WWW_PATH}
# ln -s lib/python2.7/site-packages/expedientes-9.4-py2.7.egg/expedientes/static/
# chown -R ${DEFAULT_USER}:www-data ${WWW_PATH}

a2enmod deflate

a2enmod ssl
a2ensite ${PROJECT_NAME}
a2ensite ${PROJECT_NAME}-ssl
a2dissite 000-default

# /etc/init.d/apache2 restart
systemctl reload apache
