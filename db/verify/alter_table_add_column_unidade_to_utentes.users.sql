-- Verify utentes:alter_table_add_column_unidade_to_utentes.users on pg

BEGIN;

SELECT unidade FROM utentes.users WHERE FALSE;

ROLLBACK;
