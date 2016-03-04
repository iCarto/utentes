-- Verify create_table_domains_posto

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.posto
WHERE FALSE;

ROLLBACK;
