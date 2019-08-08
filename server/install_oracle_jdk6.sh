#!/bin/bash

# https://askubuntu.com/questions/67909/how-do-i-install-oracle-jdk-6
# http://www.webupd8.org/2017/06/why-oracle-java-7-and-6-installers-no.html
source variables.ini

PLATFORM="${1}"

if [ "${PLATFORM}" = "32" ]; then
    JAVA_FILE="jdk-6u45-linux-i586.bin"
elif [ "${PLATFORM}" = "64" ]; then
    JAVA_FILE="jdk-6u45-linux-x64.bin"
else
    echo "La plataforma de java deber ser: 32 o 64"
    exit 1
fi

if [ ! -f "/vagrant/${JAVA_FILE}" ]; then
    echo "El fichero de java /vagrant/${JAVA_FILE} no existe"
    exit 1
fi

chmod a+x "/vagrant/${JAVA_FILE}"
/vagrant/"${JAVA_FILE}"

mkdir -p /usr/lib/jvm
mv jdk1.6.0_45 /usr/lib/jvm

update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.6.0_45/bin/java" 1
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.6.0_45/bin/javac" 1
update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.6.0_45/bin/javaws" 1

update-alternatives --set java /usr/lib/jvm/jdk1.6.0_45/bin/java
update-alternatives --set javac /usr/lib/jvm/jdk1.6.0_45/bin/javac
update-alternatives --set javaws /usr/lib/jvm/jdk1.6.0_45/bin/javaws

echo '
JAVA_HOME=/usr/lib/jvm/jdk1.6.0_45
JAVA_BIN=$JAVA_HOME/bin
PATH=$PATH:$JAVA_HOME:$JAVA_BIN
CLASSPATH=/usr/lib/jvm/jdk1.6.0_45  # not sure if really needed
export JAVA_HOME
export JAVA_BIN
export PATH
export CLASSPATH  # not sure if really needed
' >> /etc/profile
