
# bash ./upload_and_dump_all.sh

source ../server/variables.ini

WWW_PATH=/var/www/utentes

cd ~
git clone https://github.com/iCarto/utentes-deploy.git
cp -R ~/utentes-deploy/base-arasul/utentes-api/* ${WWW_PATH}/utentes-api/


rm -rf ${WWW_PATH}
mkdir -p ${WWW_PATH}
cd ${WWW_PATH}
git clone https://github.com/iCarto/utentes-api.git
cd utentes-api
git checkout 1360_workflow
cd utentes/static
git clone https://github.com/iCarto/utentes-ui.git
cd utentes-ui
git checkout 1360_workflow


sed -i "s/aranorte/arasul/" ${WWW_PATH}/utentes-api/production.ini
sed -i "s/aranorte/arasul/" ${WWW_PATH}/utentes-api/development.ini
sed -i 's%sqlalchemy.url.*%sqlalchemy = postgresql://postgres@localhost:5432/arasul%' ${WWW_PATH}/utentes-api/development.ini


workon utentes
cd ${WWW_PATH}/utentes-api
python setup.py develop
python setup.py install

[ -f secret.sh ] && bash secret.sh ${WWW_PATH}/utentes-api/
