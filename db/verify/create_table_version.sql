-- Verify utentes:create_table_version on pg

BEGIN;

SELECT * FROM utentes.version WHERE false;

ROLLBACK;
