-- Verify create_table_domains_distrito

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.distrito
WHERE FALSE;

ROLLBACK;
