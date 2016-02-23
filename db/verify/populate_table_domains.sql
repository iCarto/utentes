-- Verify utentes:populate_table_domains on pg

BEGIN;

SELECT 1/count(*) FROM utentes.domains;

ROLLBACK;
