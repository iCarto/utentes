#!/bin/bash

##########################
# Variables obligatorias #
##########################

# MY_REPO. uri to the repositorie with the full url including the token
# If it's a private repo a deploy token must be created and included in this variable
export MY_REPO=''

# Which branch of the repo should be deployed
REPO_BRANCH=development

# Authorized public keys
SSH_PUB_KEYS=''

# A new user will be created, usually the same name as the PROJECT_NAME
export DEFAULT_USER=''

# Password for the new user
export DEFAULT_USER_PASSWORD=''

# Database password for postgres user
export PG_POSTGRES_PASSWD=''

########################
# Variables opcionales #
########################

# Puerto que se usará para PostgreSQL
# export PG_PORT=9001

# Ruta al dump de la base de datos que se restaurara, en caso de existir
# DUMP_FILE=/tmp/${DATE}_${PROJECT_NAME}_deploy/${DATE}_${PROJECT_NAME}.dump
export DUMP_FILE=

# Ruta a una .tar.gz que contiene la carpeta "media" (ficheros modificables por usuarios
# tipo fotos) en caso de existir
# MEDIA_FILE=/tmp/${DATE}_${PROJECT_NAME}_deploy/${DATE}_media_${PROJECT_NAME}.tar.gz
export MEDIA_FILE=

# If postgres should only listen on localhost or also for external connection
# export PG_ALLOW_EXTERNAL_CON=false

# export SSH_PORT=10000
# export MY_HOSTNAME=
# export SERVER_RDNS=

#############################
# No tocar a partir de aquí #
#############################

if [[ $(id -u -n) != "root" ]]; then
    echo "Este script debe ejecutarse como root"
    exit 1
fi

# starts_with_https() {
#    [[ "${1}" =~ ^git.* ]]
# }
# if ! starts_with_git "${MY_REPO}"; then
#     # git protocol can no be used without set the public key first
#     echo "First parameter must be the repo url"
#     exit 1
#   fi

export DEBIAN_FRONTEND=noninteractive
export UCF_FORCE_CONFFNEW=1
apt update && apt upgrade -y
apt install -y git emacs-nox

cd /tmp

git clone "${MY_REPO}"

MY_REPO_FOLDER=$(echo "${MY_REPO}" | awk -F '/' '{gsub(".git", ""); print $NF}')

cd "${MY_REPO_FOLDER}/server/"
git checkout "${REPO_BRANCH}"

export FIRST_TIME_DEPLOY=true
export DEPLOYMENT=PROD
bash add_default_user.sh

# mv /tmp/"${MY_REPO}" "${DEFAULT_USER_HOME}"/"${MY_REPO}"
# cd "${DEFAULT_USER_HOME}"/"${MY_REPO}"/server
chown -R "${DEFAULT_USER}":"${DEFAULT_USER}" ../../"${MY_REPO_FOLDER}"

bash bootstrap.sh "${DEPLOYMENT}"
source variables.ini

mkdir -p "${DEFAULT_USER_HOME}"/.ssh
echo "${SSH_PUB_KEYS}" >> "${DEFAULT_USER_HOME}"/.ssh/authorized_keys
chown -R "${DEFAULT_USER}":"${DEFAULT_USER}" "${DEFAULT_USER_HOME}"/.ssh
chmod 700 "${DEFAULT_USER_HOME}"/.ssh
chmod 600 "${DEFAULT_USER_HOME}"/.ssh/authorized_keys

cd "${WWW_PATH}"/..
rm -rf "${WWW_PATH}"
git clone "${MY_REPO}"

cd "${WWW_PATH}"/
git checkout "${REPO_BRANCH}"

chown -R "${DEFAULT_USER}":www-data "${WWW_PATH}"

source tools/db_utils.sh
PGPASSWORD="${PG_POSTGRES_PASSWD}" create_last_db "${TODAY}_bck_${DBNAME}" "${DATABASE_DUMP}"
PGPASSWORD="${PG_POSTGRES_PASSWD}" create_db_from_template "${TODAY}_bck_${DBNAME}" "${DBNAME}"

if [[ -f "${MEDIA_FILE}" ]]; then
    tar xzf "${MEDIA_FILE}"
    # rm -rf "${WWW_MEDIA_PATH}"
    mv media/* /var/www/media
    # cp -r "${MEDIA_FOLDER}" "${WWW_MEDIA_PATH}"
    chown -R "${DEFAULT_USER}":www-data /var/www/media
    rm -r media
fi

echo -e "\n\n******** FINISH ********************\n\n"
echo "Update internal project documentation"
echo "
echo '${IP} ${MY_HOSTNAME}' >> /etc/hosts
echo -e 'Host ${MY_HOSTNAME}\n  HostName ${IP}\n  Preferredauthentications publickey\n  IdentityFile ~/.ssh/YOUR_KEY\n  Port ${SSH_PORT}\n  User ${MY_HOSTNAME}' >> ~/.ssh/config

# Update password manager with root, ${MY_HOSTNAME} and postgres password

# If needed, adjust other config like:
bash config_ssh.sh # edit it first

# In another shell ssh as non root user, check everything is ok and
# deploy the app, as not root

# workon ${PROJECT_NAME}
cd back
# Adjust production.ini
# python setup.py install
# restart apache
"
