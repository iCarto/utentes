-- Revert utentes:alter_table_facturacao_add_column_factura_and_recibo_dates from pg

BEGIN;

ALTER TABLE utentes.facturacao DROP COLUMN fact_date;
ALTER TABLE utentes.facturacao DROP COLUMN recibo_date;

COMMIT;
