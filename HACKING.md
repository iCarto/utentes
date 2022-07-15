In a hurry? Go to [Recap](#recap)

# Conventions

We asume that the following variables are set up if you are copy&pasting the commands in this file.

You can use your own values.

```
# Name of the proyect. Used for virtualenv names and other stuff
PROJECT_NAME=utentes

# Base directory for the whole project. Helper folders and repos are inside
PROJECT_ROOT_PATH=~/development/sixhiara

# The last deployed  version
VERSION=$(date +%y%m%d) # like 220315
```

# Git Structure

-   back: Pyramid. With Server Side Rendering via Jinja2. JavaScript as static files compiled with webassets.
-   front: Not used now.
-   scripts: For install, deploy, ... scripts-to-rule-them-all style
-   db: For sqitch
-   tools: For utilities, wrangling data and so on, ...
-   docs
-   server: Provisioning for Vagrant (development) and VPS (production)

## Other repos

-   https://gitlab.com/icarto/utentes-api. SIRHA: Utentes. Web application to manage water users and licenses
-   https://gitlab.com/icarto/sixhiara. SIRHA: Inventario. gvSIG based application to manage water resources cadastre
-   https://gitlab.com/icarto/utentes-bd. Deprecated. Database (sqitch), tools and scripts, ...
-   https://gitlab.com/icarto/utentes-deploy. Deprecated. Tools to package SIRH:Utentes as a desktop application with Electron
-   https://gitlab.com/icarto/utentes-deploy/sixhiara-formacion. E-R db diagrams, slides, workshops, and other doc related to the project

## Branches and Tags

-   `main`. principal branch. Code deployed in production. Only maintainers push here.
-   `development`. PR and development goes here. Only maintainers push here. Start your feature branch from here. After a feature is tested in staging is integrated here. Commits can be rewrited with `rebase -i` before the push
-   `staging`. Code deployed in staging (pre production). This branch can be rewrited with `push -f` and `rebase -i`.
-   `<xxxx>_<feature>`. Feature branches started from `development`. Can be rewrited with `push -f` and `rebase -i`

Each new deployed version should be tagged with `"${VERSION}"`

### Git Workflow for developing a feature

When you start a new feature.

```shell
git branch -D staging
# git branch -D <other_branches_not_needed>
git pull --rebase
git pull --rebase origin main
git pull --rebase origin development
git remote prune origin

git co development
git co -b <xxxx>_<feature>

# Work on you branch, and before push

git branch -D staging
# git branch -D <other_branches_not_needed>
git pull --rebase
git pull --rebase origin main
git pull --rebase origin development
git remote prune origin

git co <xxxx>_<feature>
git rebase development

git push origin -u <xxxx>_<feature>
```

Remember that if someone pushes also to `<xxxx>_<feature>` you must rebase also this changes

```
git pull --rebase origin <xxxx>_<feature>
```

## Pre Commit

The project is setup by default with strict linters and formatters that run on pre commit. But sometimes a quick fix is needed and you want to go over the linters. Use `git commit --no-verify` or set it to `[manual]` in `.pre-commit-config.yaml`.

# General Folder Structure

Some scripts are configured to search for locations outside the main git folder. Keeping a common structure for the whole project helps standarize processes.

```text
| "${PROJECT_ROOT_PATH}"
| |- sixhiara
| |- utentes-api
| |- utentes-bd
| |- Tasks
| |  | - task_<xxx>_<short_name>
| |- bck-sirha
```

# Pre-Requisites

Check `server/bootstrap.sh` for automatized way of configuring the tools.

-   [VirtualBox and Vagrant](https://gitlab.com/icarto/ikdb/blob/master/configurar_equipo/linux/virtualbox_y_vagrant.md)
-   [nodejs y npm](https://gitlab.com/icarto/ikdb/blob/master/configurar_equipo/linux/instalar_y_actualizar_node_y_npm.md)
-   [Virtualenwrapper](https://gitlab.com/icarto/ikdb/-/blob/master/python/python_tooling_virtualenvwrapper.md#instalaci%C3%B3n)
-   [pyenv](https://gitlab.com/icarto/ikdb/-/blob/master/python/python_tooling_pyenv.md#instalaci%C3%B3n)
-   [shfmt](https://gitlab.com/icarto/ikdb/-/blob/wip_linters/linters_estilo_codigo_y_formatters/estilo_codigo_y_formatters/herramientas/formatters_bash.md#configuraci%C3%B3n-icarto)
-   [shellcheck](https://gitlab.com/icarto/ikdb/-/blob/wip_linters/linters_estilo_codigo_y_formatters/linters/5.linters_bash.md#configuraci%C3%B3n-icarto)

This pre-requistes should be installed previous to the current user session. So if this is the first time you are installing it, _Log out_ from the host and _Log in_ again.

Remember to keep the used ports open and unused: `6543`, `9001`, `8000`.

```shell
sudo lsof -i -P -n | grep LISTEN
```

_Note_: Probably, you can avoid install things in your host accessing the Vagrant guess as it should contain all the dependencies. So you can even launch the back/front inside the Vagrant just opening the appropriate ports. But, this workflow was not tested.

# First Time and Each Development Phase

Most of the Development Environment setup can be done with scripts in Ubuntu 20.04. But some of then mess up with your operating system config files and ask for `sudo` access. So carefully review what is being done.

A production like environment is setup with Vagrant.

We strongly recommend follow this steps before each "development phase" to ensure that the latest dependencies have been upgraded.

Check the [recap](#recap) section for the commands

## Restore fixtures/development database

Use the script

```shell
./scripts/reset_and_create_db.sh --post --version "${VERSION}" [--dir DUMP_FOLDER]
```

# Development

The common workflow:

```shell
workon "${PROJECT_NAME}"
code . # or your favourite IDE
./scripts/start.sh
```

Instead of `start.sh` script you can open two consoles:

````shell
# Launch back
workon "${PROJECT_NAME}"
cd back; pserve development.ini --reload

# Lauch front
cd front; npm start
```

# Deployment

NOT READY YET

```shell
./scripts/pre-deploy.sh
./scripts/deploy.sh
```

Example

```shell
workon "${PROJECT_NAME}"
git ir a la rama buena y hacer fetch
# git clean -fdx Not do it because remove the .env
cd back && pip install -r requirements.txt && cd ..
# Increase memory space for compiling client
export NODE_OPTIONS=--max_old_space_size=1024
cd front && npm install && npm run build && cd ..
cd back && echo -e "yes" | python manage.py collectstatic -c && cd ..
cd sqitch && sqitch deploy && cd ..
systemctl restart apache2
```

# Automated Test

Launch all tests with `./scripts/test.sh`. Take care that this includes e2e tests and can be pretty slow.

## Backend tests

```shell
# All backend tests
# -Wd to show deprecated warnings mostrar los warnings de deprecated
python -Wd -m unittest discover -s utentes.tests

# Only the tests on `api` package
python -m unittest discover -s utentes.tests.api

# Only one test
python -m unittest utentes.tests.api.test_cultivos_get.CultivosGET_IntegrationTests.test_cultivo_get_length

# -failfast. Stops executing of first failure
python -m unittest discover --failfast -s utentes.tests
```

## Database tests (pgTap)

It is recommend launch it from inside the Vagrant to avoid version problems.

```shell
vagrant ssh
cd /vagrant/bd

# Launch without -Q flag for getting more info on errors
pg_prove -Q tests/
```


# Test in a production like environment

NOT READY YET

```shell
vagrant ssh
workon "${PROJECT_NAME}"
./scripts/deploy.sh
```



# Recap

After installing the pre-requisites.

## First time only

```shell
cd "${PROJECT_ROOT_PATH}"
git clone git@gitlab.com:icarto/sixhiara.git
git clone git@gitlab.com:icarto/utentes-api.git
# Ya no se usa
# git clone https://gitlab.com/icarto/utentes-deploy
```

## Each development phase

```shell
git branch -D staging
# git branch -D <other_branches_not_needed>
git pull --rebase
git pull --rebase origin main
git pull --rebase origin development
git remote prune origin

git co development

# Clean up
source server/variables.ini
vagrant destroy
rmvirtualenv "${PROJECT_NAME}"

vagrant up
vagrant halt
vagrant up

# Set up the dependencies
./scripts/install.sh

# Download fixture/test databases
# Use --dir if recommended folder hierarchy is not followed
./scripts/reset_and_create_db.sh --post --version ${VERSION} [--dir DUMP_FOLDER]

deactivate

workon "${PROJECT_NAME}"

./scripts/test.sh
```

