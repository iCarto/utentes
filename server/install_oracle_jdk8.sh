#!/bin/bash

source variables.ini

# There are several ways to install Oracle HotSpot JDK in Ubuntu systems
# Easiest, maybe not best, way is use the PPA from webupd8team
# http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
# https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04
# https://help.ubuntu.com/community/Java

apt-get purge icedtea-* openjdk-*

apt-get install -y software-properties-common
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
add-apt-repository -y ppa:webupd8team/java
apt-get update
apt-get install -y oracle-java8-installer oracle-java8-set-default

# Use update-alternatives if needed

# Set JAVA_HOME and JRE_HOME environment variables which are used by some Java applications in /etc/environment
# cat >> /etc/environment <<EOL
# JAVA_HOME=/usr/lib/jvm/java-8-oracle
# JRE_HOME=/usr/lib/jvm/java-8-oracle/jre
# EOL

# java -version != 1.8.xxx => ERROR
