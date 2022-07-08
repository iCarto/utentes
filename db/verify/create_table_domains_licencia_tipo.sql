-- Verify create_table_domains_licencia_tipo

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.licencia_tipo
WHERE FALSE;

ROLLBACK;
