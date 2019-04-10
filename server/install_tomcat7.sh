#!/bin/bash

source variables.ini


apt-get remove -y --purge tomcat6
rm -rf /usr/share/tomcat6

apt-get install -y tomcat7
mkdir -p /etc/.java/.systemPrefs/

MY_PATH="/etc/.java/"
# sudo chown -R tomcat7:tomcat7 "${MY_PATH}" # TO BE INVESTIGATED
sudo find "${MY_PATH}" -type d -exec chmod 751 {} \;
sudo find "${MY_PATH}" -type f -exec chmod 644 {} \;
