-- Verify create_table_domains

BEGIN;

SELECT gid, category, value, alias, ordering, parent
FROM utentes.domains
WHERE FALSE;

ROLLBACK;
