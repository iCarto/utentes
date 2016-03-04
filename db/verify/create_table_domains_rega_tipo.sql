-- Verify create_table_domains_rega_tipo

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.rega_tipo
WHERE FALSE;

ROLLBACK;
