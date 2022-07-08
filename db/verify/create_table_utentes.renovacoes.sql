-- Verify utentes:create_table_utentes.renovacoes on pg

BEGIN;

SELECT * FROM utentes.renovacoes WHERE false;

ROLLBACK;
