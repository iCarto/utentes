-- Verify create_table_domains_subacia

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.subacia
WHERE FALSE;

ROLLBACK;
