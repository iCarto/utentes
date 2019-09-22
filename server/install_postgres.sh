#!/bin/bash

source variables.ini

if [[ "${PG_VERSION}" == "9.1" ]]; then
    apt-get install -y postgresql-${PG_VERSION} postgresql-contrib-${PG_VERSION} postgresql-server-dev-${PG_VERSION} postgresql-${PG_VERSION}-postgis
    if ! sudo -u postgres psql -d template_postgis -c "select postgis_version();" > /dev/null 2>&1; then
        sudo -u postgres createdb -E utf8 --locale=es_ES.utf8 -O postgres -T template0 template_postgis
        sudo -u postgres createlang -d template_postgis plpgsql
        sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/${PG_VERSION}/contrib/postgis-1.5/postgis.sql
        sudo -u postgres psql -d template_postgis -f /usr/share/postgresql/${PG_VERSION}/contrib/postgis-1.5/spatial_ref_sys.sql
    fi
else
    echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
    wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
    apt-get update
    # apt-cache depends package-name
    # apt-cache rdepends package-name
    # dpkg -L package-name
    apt-get install -y postgresql-${PG_VERSION} postgresql-contrib-${PG_VERSION} postgresql-server-dev-${PG_VERSION} postgresql-${PG_VERSION}-postgis-${POSTGIS_VERSION}
    # apt-get install -y postgresql-${PG_VERSION}-postgis-${POSTGIS_VERSION}-scripts # para instalar topology, tiger, ...
    # https://askubuntu.com/questions/117635/how-to-install-suggested-packages-in-apt-get
    # `postgis` can recommends other PG_VERSION so to avoid installation this must be done in two steps
    apt-get install -y --no-install-recommends postgis
fi

mv /etc/postgresql/${PG_VERSION}/main/postgresql.conf /etc/postgresql/${PG_VERSION}/main/postgresql.conf.${PG_VERSION}.org
grep -v '^#' /etc/postgresql/${PG_VERSION}/main/postgresql.conf.${PG_VERSION}.org | grep '^[ ]*[a-z0-9]' > /etc/postgresql/${PG_VERSION}/main/postgresql.conf
grep -v '^#' /etc/postgresql/${PG_VERSION}/main/postgresql.conf.${PG_VERSION}.org | grep '^[ ]*[a-z0-9]' > /etc/postgresql/${PG_VERSION}/main/postgresql.conf.${PG_VERSION}.org.no_comments
cp /etc/postgresql/${PG_VERSION}/main/pg_hba.conf /etc/postgresql/${PG_VERSION}/main/pg_hba.conf.${PG_VERSION}.org
if $PG_ALLOW_EXTERNAL_CON; then
    echo "listen_addresses = '*'" >> /etc/postgresql/${PG_VERSION}/main/postgresql.conf
fi
sed -i "s/^port[ ]*=[ ]*[0-9]*/port = ${PG_PORT}/" /etc/postgresql/${PG_VERSION}/main/postgresql.conf
echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/${PG_VERSION}/main/pg_hba.conf
chown postgres:postgres /etc/postgresql/${PG_VERSION}/main/pg_hba.conf
chown postgres:postgres /etc/postgresql/${PG_VERSION}/main/postgresql.conf
chmod 640 /etc/postgresql/${PG_VERSION}/main/pg_hba.conf
chmod 644 /etc/postgresql/${PG_VERSION}/main/postgresql.conf
chmod a-w /etc/postgresql/${PG_VERSION}/main/postgresql.conf.${PG_VERSION}.org
chmod a-w /etc/postgresql/${PG_VERSION}/main/postgresql.conf.${PG_VERSION}.org.no_comments
chmod a-w /etc/postgresql/${PG_VERSION}/main/pg_hba.conf.${PG_VERSION}.org

# https://stackoverflow.com/questions/1988249/how-do-i-use-su-to-execute-the-rest-of-the-bash-script-as-that-user
sudo -u "${DEFAULT_USER}" -H ./config_postgres_dotfiles.sh

systemctl restart postgresql

sudo -u postgres psql postgres -c "ALTER USER postgres WITH PASSWORD '${PG_POSTGRES_PASSWD}';"
# sudo -u postgres psql postgres -v pwd=$"{PG_POSTGRES_PASSWD}" -c "ALTER USER postgres WITH PASSWORD :'pwd';"
