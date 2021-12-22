#!/bin/bash

# set -x
set -e

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

# shellcheck source=variables.ini
source "${this_dir}"/variables.ini

# Los mismos pasos se pueden usar dentro del Vagrant para probar en modo producción.
# En lugar del clone se puede jugar con los `synced_folder` y limpiar el
# repositorio con `git clean -ndx` y `git clean -fdx`

rama=${1:-master}

if [[ $(whoami) != 'vagrant' ]]; then
    echo "Sólo usable en testing"
    exit 1
fi

# Workaround. `.bashrc` no se lee por defecto en los scripts
# Mejor redefinir aquí a obligar a invocar el script de una forma determinada
VIRTUALENVWRAPPER_PYTHON=$(command -v "python${PYTHON_VERSION}")
source /usr/local/bin/virtualenvwrapper.sh

lsvirtualenv -b | grep -q -e "^${PROJECT_NAME}_old$" && rmvirtualenv "${PROJECT_NAME}_old"
lsvirtualenv -b | grep -q -e "^${PROJECT_NAME}$" && cpvirtualenv "${PROJECT_NAME}" "${PROJECT_NAME}_old" && deactivate
# setvirtualenvproject [virtualenv_path project_path]
lsvirtualenv -b | grep -q -e "^${PROJECT_NAME}$" && rmvirtualenv "${PROJECT_NAME}"

rm -rf "${WWW_PATH}_old"
[[ -d "${WWW_PATH}" ]] && mv "${WWW_PATH}" "${WWW_PATH}_old"

git clone "${GIT_REPO}" "${WWW_PATH}"

# https://github.com/pexpect/pexpect/commit/71bbdf52ac153c7eaca631637ec96e63de50c2c7
mkvirtualenv -a "${WWW_PATH}" "${PROJECT_NAME}" || true
git checkout "${rama}"
# sed -i 's%postgresql://audasa_user@localhost:5432/SIGA%postgresql://audasa_user@localhost:5432/audasa_test%' /var/www/expedientes/production.ini
python setup.py install
sudo systemctl restart apache2
