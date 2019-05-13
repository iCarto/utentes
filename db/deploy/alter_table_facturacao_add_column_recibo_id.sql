-- Deploy utentes:alter_table_facturacao_add_column_recibo_id to pg

BEGIN;

ALTER TABLE utentes.facturacao ADD COLUMN recibo_id TEXT UNIQUE;

COMMIT;
