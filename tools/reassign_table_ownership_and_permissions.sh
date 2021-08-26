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
