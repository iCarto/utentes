-- Verify create_table_domains

BEGIN;

SELECT gid, category, value, alias, ordering, parent, tooltip
FROM utentes.domains
WHERE FALSE;

ROLLBACK;
