-- Verify create_table_domains_energia_tipo

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.energia_tipo
WHERE FALSE;

ROLLBACK;
