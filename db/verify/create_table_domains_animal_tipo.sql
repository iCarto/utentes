-- Verify create_table_domains_animal_tipo

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.animal_tipo
WHERE FALSE;

ROLLBACK;
