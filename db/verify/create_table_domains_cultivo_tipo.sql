-- Verify create_table_domains_cultivo_tipo

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.cultivo_tipo
WHERE FALSE;

ROLLBACK;
