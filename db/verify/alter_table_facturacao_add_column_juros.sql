-- Verify utentes:alter_table_facturacao_add_column_juro on pg

BEGIN;

SELECT juros FROM utentes.facturacao WHERE FALSE;

ROLLBACK;
