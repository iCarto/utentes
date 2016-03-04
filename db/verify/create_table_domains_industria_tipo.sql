-- Verify create_table_domains_industria_tipo

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.industria_tipo
WHERE FALSE;

ROLLBACK;
