-- Deploy utentes:alter_table_facturacao_add_column_factura_and_recibo_dates to pg

BEGIN;

ALTER TABLE utentes.facturacao ADD COLUMN fact_date date;
ALTER TABLE utentes.facturacao ADD COLUMN recibo_date date;

COMMIT;
