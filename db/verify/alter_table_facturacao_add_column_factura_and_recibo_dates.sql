-- Verify utentes:alter_table_facturacao_add_column_factura_and_recibo_dates on pg

BEGIN;

SELECT fact_date, recibo_date FROM utentes.facturacao WHERE FALSE;

ROLLBACK;
