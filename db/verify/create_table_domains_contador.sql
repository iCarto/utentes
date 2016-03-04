-- Verify create_table_domains_contador

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.contador
WHERE FALSE;

ROLLBACK;
