-- Revert utentes:alter_table_facturacao_add_column_recibo_id from pg

BEGIN;

ALTER TABLE utentes.facturacao DROP COLUMN recibo_id;

COMMIT;
