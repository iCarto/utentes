#!/bin/bash

# fill this variable with commit hash target or branch to do checkout
commitTarget="master"
basicApps="vim htop iotop nginx git curl"
parentRepoDir="/home/vagrant/sixhiara/"
repoDir=$parentRepoDir"sixhiara-visor/"

###
### update the system and install some basic software
###

apt-get update
apt-get install aptitude -y

aptitude upgrade -y
aptitude install $basicApps -y


###
### enable webserver in systemd
###

systemctl enable nginx


###
### setting up ssh
###

# TODO: configure ssh key in order to can use git repository


###
### Updating project source code
###

if [ -d $repoDir ]; then
	mkdir -p $parentRepoDir
	cd $parentRepoDir
    git clone git@gitlab.com:icarto-private/sixhiara-visor.git
    git clone git@gitlab.com:icarto-private/dngrh-visor.git
fi

cd $repoDir

systemctl stop nginx

# update repository
su vagrant -c "git fetch && git checkout $commitTarget && git pull"

###
### configuring nginx
###

# at this time, only change the root directory

sedPattern=$(sed 's/\//\\\//g' <<< $repoDir)

cp -fp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.back
sed "s/\/var\/www\/html/$sedPattern/g" /etc/nginx/sites-available/default > /tmp/default.sed
cp -f /tmp/default.sed /etc/nginx/sites-available/default

#restart web server
systemctl start nginx
