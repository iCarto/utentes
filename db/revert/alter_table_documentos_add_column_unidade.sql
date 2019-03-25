-- Revert utentes:alter_table_documentos_add_column_unidade from pg

BEGIN;

ALTER TABLE utentes.documentos DROP COLUMN unidade;

COMMIT;
