#!/bin/bash

set -e

source variables.ini

###### Ejecutar a mano #######
#
# sed -e '/SendEnv/ s/^#*/#/' -i /etc/ssh/ssh_config
# sed -e '/AcceptEnv/ s/^#*/#/' -i /etc/ssh/sshd_config
# sed -i "s/#Port 22/Port $SSH_PORT/" /etc/ssh/sshd_config
# systemctl restart sshd

# IP=`curl -s ipinfo.io/ip`
# echo $IP
# hostnamectl set-hostname $MY_HOSTNAME
# echo "$IP $MY_HOSTNAME" >> /etc/hosts
# adduser $MY_HOSTNAME
# exit

# Anotar claves de root y $MY_HOSTNAME
# Configurar en local /etc/hosts y ~/.ssh/ssh_config
# echo "$IP $MY_HOSTNAME" >> /etc/hosts
# echo -e "Host $MY_HOSTNAME\n  Port $SSH_PORT\n  User $MY_HOSTNAME" >> ~/.ssh/config
# ssh-copy-id ourol

# ssh $MY_HOSTNAME
# sudo apt-get install -y git
# ssh-keygen -t rsa -C "info@icarto.es" -b 4096
# cat ~/.ssh/id_rsa.pub ==> https://gitlab.com/icarto-private/$MY_HOSTNAME/settings/repository#js-deploy-keys-settings
# git clone git@gitlab.com:icarto-private/$MY_HOSTNAME.git
# sudo su
# cd $MY_HOSTNAME/server
# bash linode.sh and all the others
#############################################################

# https://www.linode.com/docs/getting-started/
apt-get update && apt-get upgrade -y

timedatectl set-timezone "${MY_TIMEZONE}"

apt-get install -y unattended-upgrades
# https://help.ubuntu.com/lts/serverguide/automatic-updates.html

sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#*PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
echo 'AddressFamily inet' | tee -a /etc/ssh/sshd_config
systemctl restart sshd

# https://www.linode.com/docs/security/using-fail2ban-for-security
# https://www.linode.com/docs/security/securing-your-server
# https://duckduckgo.com/?q=sendmail+linode&atb=v42-5__&ia=web
apt-get install -y fail2ban sendmail ufw
systemctl start fail2ban
systemctl enable fail2ban
systemctl start sendmail
systemctl enable sendmail
echo -e '[Definition]\n\nloglevel = WARNING' > /etc/fail2ban/fail2ban.local

ufw default deny incoming
ufw default allow outgoing
ufw delete deny ssh
ufw allow $SSH_PORT/tcp
if $PG_ALLOW_EXTERNAL_CON; then
    ufw allow $PG_PORT/tcp
fi
ufw allow http
ufw allow https
ufw enable

# http://go2linux.garron.me/linux/2011/06/lc-ctype-default-locale-no-such-file-or-directory-1089.html
# https://github.com/omega8cc/boa/commit/93444296247afbc34b3eaec20f45cd5a38b2b6e9
# https://serverfault.com/questions/644318/how-do-i-fix-my-locale-settings-on-ubuntu-12-04-lts-on-my-linode
# https://linodeb0x.blogspot.com.es/2012/11/deploy-your-linode.html
