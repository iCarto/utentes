-- Revert utentes:alter_table_facturacao_add_column_juro from pg

BEGIN;

ALTER TABLE utentes.facturacao DROP COLUMN juros;

COMMIT;
