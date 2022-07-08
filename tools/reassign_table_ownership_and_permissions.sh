#!/bin/bash

set -e

this_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

source server/variables.ini

${PSQL} -d test -c "
    SELECT 'ALTER TABLE '||schemaname||'.'||tablename||' OWNER TO test;'
    FROM pg_tables
    WHERE schemaname IN ('utentes', 'domains', 'inventario', 'elle', 'inventario_dominios', 'cbase', 'cbase_ara');
" > test.txt

echo "
GRANT ALL ON SCHEMA public TO test;
GRANT ALL ON SCHEMA utentes TO test;
GRANT ALL ON SCHEMA domains TO test;
GRANT ALL ON SCHEMA inventario TO test;
GRANT ALL ON SCHEMA inventario_dominios TO test;
GRANT ALL ON SCHEMA elle TO test;
" >> test.txt

${PSQL} -d test -f test.txt

CREATE ROLE test WITH PASSWORD 'test' LOGIN CREATEDB
GRANT ALL PRIVILEGES ON DATABASE test to test

# https://stackoverflow.com/questions/8092086
DO $$
BEGIN
CREATE ROLE test
EXCEPTION WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE
END
$$
ALTER ROLE test WITH PASSWORD 'test' NOSUPERUSER CREATEDB NOCREATEROLE NOINHERIT LOGIN NOREPLICATION NOBYPASSRLS CONNECTION LIMIT 2

# https://stackoverflow.com/questions/59828135
REVOKE CONNECT ON DATABASE arasul FROM test
