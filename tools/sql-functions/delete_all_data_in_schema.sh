#!/bin/bash

# https://stackoverflow.com/questions/13223820/postgresql-delete-all-content
# https://stackoverflow.com/questions/2829158/truncating-all-tables-in-a-postgres-database
# https://stackoverflow.com/questions/58940086/is-it-possible-to-combine-c-and-v-in-psql

# Usage
# bash delete_all_data_in_schema.sh utentes
# or like
#
# sql_query=$(bash "${this_dir}/sql-functions/delete_all_data_in_schema.sh" "${SCHEMA}")
# echo "${sql_query}"
# ${PSQL} -c "${sql_query}"

SCHEMA="${1}"

if [ -z "${SCHEMA}" ]; then
    echo "ERROR. Introduzca el esquema"
    exit 1
fi

! read -r -d '' sql_query << EOF
DO
\$func\$
BEGIN
   -- RAISE NOTICE '%',
   EXECUTE
   (SELECT 'TRUNCATE TABLE ' || string_agg(oid::regclass::text, ', ') || ' CASCADE'
    FROM   pg_class
    WHERE  relkind = 'r'  -- only tables
    AND    relnamespace = '${SCHEMA}'::regnamespace
   );
END
\$func\$;
EOF

echo "${sql_query}"
