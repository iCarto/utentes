-- Verify create_table_domains_bacia

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.bacia
WHERE FALSE;

ROLLBACK;
