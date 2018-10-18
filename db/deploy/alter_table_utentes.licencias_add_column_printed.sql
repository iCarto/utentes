-- Deploy utentes:alter_table_utentes.licencias_add_column_printed to pg

BEGIN;

ALTER TABLE utentes.licencias ADD COLUMN printed BOOLEAN DEFAULT false;

COMMIT;
