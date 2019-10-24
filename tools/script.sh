# ARA Norte
# ARA Centro-Norte
# ARA Centro
# ARA Sul
# ARA Zambeze

ARA="ARA Norte"
DATABASE="dev"

# Estás cuatro queries tienen que devolver un 0 rows. Si no es que algún dato está mal.
psql -h localhost -p 9001 -U postgres -d "${DATABASE}" --no-psqlrc -v ON_ERROR_STOP=1 --pset pager=off -c "
WITH foo as (select distinct trim(unnest(string_to_array(ara, ','))) as a from cbase.provincias ) select * from foo where a NOT IN ('ARA Norte', 'ARA Zambeze', 'ARA Sul', 'ARA Centro-Norte', 'ARA Centro');
"

psql -h localhost -p 9001 -U postgres -d "${DATABASE}" --no-psqlrc -v ON_ERROR_STOP=1 --pset pager=off -c "
WITH foo as (select distinct trim(unnest(string_to_array(ara, ','))) as a from cbase.distritos ) select * from foo where a NOT IN ('ARA Norte', 'ARA Zambeze', 'ARA Sul', 'ARA Centro-Norte', 'ARA Centro');
"

psql -h localhost -p 9001 -U postgres -d "${DATABASE}" --no-psqlrc -v ON_ERROR_STOP=1 --pset pager=off -c "
WITH foo as (select distinct trim(unnest(string_to_array(ara, ','))) as a from cbase.postos ) select * from foo where a NOT IN ('ARA Norte', 'ARA Zambeze', 'ARA Sul', 'ARA Centro-Norte', 'ARA Centro');
"

psql -h localhost -p 9001 -U postgres -d "${DATABASE}" --no-psqlrc -v ON_ERROR_STOP=1 --pset pager=off -c "
WITH foo as (select distinct trim(unnest(string_to_array(ara, ','))) as a from cbase.bacias ) select * from foo where a NOT IN ('ARA Norte', 'ARA Zambeze', 'ARA Sul', 'ARA Centro-Norte', 'ARA Centro');
"
