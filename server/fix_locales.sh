#!/bin/bash

source variables.ini

sed -i "s/^# ${LOCALE} UTF-8/${LOCALE} UTF-8/" /etc/locale.gen
locale-gen
update-locale --reset LANG="${LOCALE}" LC_CTYPE="${LOCALE}" LC_ALL="${LOCALE}" LANGUAGE="${LOCALE}"

export LANG="${LOCALE}"
export LC_TYPE="${LOCALE}"
export LC_ALL="${LOCALE}"
export LANGUAGE="${LOCALE}"

sed -e '/SendEnv/ s/^#*/#/' -i /etc/ssh/ssh_config
sed -e '/AcceptEnv/ s/^#*/#/' -i /etc/ssh/sshd_config
