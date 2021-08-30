# First Install

Se puede configurar un entorno similar al de producción mediante Vagrant. En la raíz del repo `utentes-bd` hay un Vagranfile que permite levantar y provisionar una vm.

La mayoría de pasos que aquí se describen, "destruir" el entorno y volver a construirlo se recomienda realizarlo en cada nuevo ciclo de trabajo.

## Pre-Requisitos

-   [Instalar VirtualBox y Vagrant](https://gitlab.com/icarto/ikdb/blob/master/configurar_equipo_linux/virtualbox_y_vagrant.md)
-   Instalar dependencias y aplicaciones del sistema. Se puede seguir el script `utentes-bd/server/bootstrap.sh` para configurar un entorno local adecuado.

_Nota_: En caso de no querer instalar directamente sobre el sistema el Vagrant contiene todo lo necesario. Se podría ejecutar `git`, `pserve`, ... desde dentro del Vagrant pero no se ha testeado el funcionamiento.

## Repositorios y Estructura de carpetas

-   https://gitlab.com/icarto/sixhiara. Aplicación de escritorio basada en gvSIG para Inventario de Recursos Hídricos
-   https://gitlab.com/icarto/utentes-api. Aplicación web de Usuarios y Licencias de Agua
-   https://gitlab.com/icarto/utentes-bd. Base de datos (sqitch), scripts adicionales, ... común al proyecto
-   https://gitlab.com/icarto/utentes-deploy. Utilidades para empaquetar Utentes como una aplicación Electron. _Ya no se usa_.

**Para que los scripts funcionen correctamente `utentes-api` y `utentes-bd` deben estar en el mismo directorio.**

```
| "${PROJECT_ROOT_PATH}"
| |- utentes-api
| |- utentes-bd
| |- Tareas
```

```bash
# Configuramos una variable como root del proyecto:
PROJECT_ROOT_PATH=~/development/sixhiara

cd "${PROJECT_ROOT_PATH}"
# App de escritorio basada en gvSIG para Inventario de Recursos Hídricos
git clone https://gitlab.com/icarto/sixhiara.
# App web de Licencias y Usuarios de Agua
git clone git@gitlab.com:icarto/utentes-api.git
# Base de datos (sqitch), scripts adicionales, ... común al proyecto
git clone git@gitlab.com:icarto/utentes-bd.git
# Utilidades para empaquetar utentes-api como una aplicación Electron
# Ya no se usa
# git clone https://gitlab.com/icarto/utentes-deploy


rmvirtualenv utentes
rmvirtualenv utentes-bd

mkvirtualenv -p /usr/bin/python3.6 -a "${PROJECT_ROOT_PATH}/utentes-api" utentes
pip install -r requirements-dev.txt
pre-commit install --install-hooks
python setup.py install
python setup.py develop

mkvirtualenv -p /usr/bin/python3.6 -a "${PROJECT_ROOT_PATH}/utentes-bd" utentes-bd
pip install -r requirements-dev.txt
pre-commit install --install-hooks

vagrant destroy
vagrant up
vagrant halt
vagrant up

# Descargar directorio con las bases de datos de test
# en `utentes-bd`
cd scripts
source db_utils.sh
DB_BACKUP_DIR=... # Ajustar. Mejor usar ruta absoluta

for dump_file in "${DB_BACKUP_DIR}"/*.dump ; do
    db=$(basename "${dump_file%.dump}")
    echo "Procesando: ${db}"
    create_last_db ${db} ${dump_file}
    if echo "${db}" | grep -q '_post_' ; then
        test_db="test_${db%%_*}"
        echo "Creando: ${test_db}"
        create_db_from_template ${db} ${test_db}
    fi
done

workon utentes
python -Wd setup.py test -q
```

## Para probar la aplicación en modo producción:

```bash
vagrant ssh
workon utentes
git status # Cuidado, este es el directorio compartido del host
emacs -nw production.ini # ajustar bd, media_root y ara
python setup.py install
sudo systemctl restart apache2
```

# Ramas

-   La rama `master` se usa como producción
-   Los desarrollos y pull request deben realizarse sobre la rama `development`

# Launch development server

    $ workon utentes
    $ pserve development.ini --reload

## Tests de pyramid

```bash
# Todos los tests
python -m unittest discover -s utentes.tests

# Sólo los tests de la API
python setup.py test -q -s utentes.tests.api


# Un test concreto
python setup.py test -q -s utentes.tests.api.test_cultivos_get.CultivosGET_IntegrationTests.test_cultivo_get_length

# Para de ejecutar los tests en el primer fallo
python -m unittest discover --failfast -s utentes.tests
```

## Tests base de datos (pgTap)

Es recomendable ejecutarlos desde dentro de la vm para evitar problemas de versiones

```bash
vagrant ssh
cd PATH_TO_SQITCH_FOLDER
```

```bash
pg_prove -Q tests/
```

Se asume que el fichero .proverc está en la carpeta sqitch y los tests se lanzan desde allí.
El anterior comando lanza los tests en modo 'quiet'. Si alguno falla para obtener información más concreta relanzaremos el comando sin -Q

```
pg_prove tests/
```
