-- Verify utentes:alter_table_facturacao_add_column_recibo_id on pg

BEGIN;

SELECT recibo_id FROM utentes.facturacao WHERE FALSE;

ROLLBACK;
