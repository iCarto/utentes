-- Verify create_table_domains_provincia

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.provincia
WHERE FALSE;

ROLLBACK;
