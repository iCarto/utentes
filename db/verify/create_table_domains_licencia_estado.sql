-- Verify create_table_domains_licencia_estado

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.licencia_estado
WHERE FALSE;

ROLLBACK;
