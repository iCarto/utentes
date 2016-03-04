-- Verify create_table_domains_fonte_tipo

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.fonte_tipo
WHERE FALSE;

ROLLBACK;
