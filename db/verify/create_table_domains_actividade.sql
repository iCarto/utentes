-- Verify create_table_domains_actividade

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.actividade
WHERE FALSE;

ROLLBACK;
