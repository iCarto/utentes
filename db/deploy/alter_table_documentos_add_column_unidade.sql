-- Deploy utentes:alter_table_documentos_add_column_unidade to pg

BEGIN;

ALTER TABLE utentes.documentos ADD COLUMN unidade text;

COMMIT;
