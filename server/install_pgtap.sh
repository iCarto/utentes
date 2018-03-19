#!/bin/bash

source variables.ini

# Otras dependecias:
# postgresql-server-dev-${PG_VERSION}

apt-get install -y unzip cpanminus
cpanm --quiet --notest TAP::Parser::SourceHandler::pgTAP
wget http://api.pgxn.org/dist/pgtap/"${PGTAP_VERSION}"/pgtap-"${PGTAP_VERSION}".zip
unzip pgtap-"${PGTAP_VERSION}".zip
cd pgtap-"${PGTAP_VERSION}"
make
make install
cd ..
rm -rf pgtap-"${PGTAP_VERSION}"
rm -rf pgtap-"${PGTAP_VERSION}".zip

# cp /vagrant/server/proverc ./sqitch/.proverc  # Already pushed to the repo
# CREATE EXTENSION pgtap;                       # Must be done by hand or when final db is ready
