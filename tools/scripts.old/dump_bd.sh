
filename=utentes-ara-norte-`date +%Y%m%d`.sql
DATABASE=sixhiara

echo "CREATE IF NOT EXISTS postgis;" > $filename
echo "DROP SCHEMA IF EXISTS utentes CASCADE;" > $filename
echo "DROP SCHEMA IF EXISTS domains CASCADE;" >> $filename

pg_dump -h localhost -p 5432 -U postgres --column-inserts --schema utentes --schema domains $DATABASE >> $filename
