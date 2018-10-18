-- Revert utentes:alter_table_utentes.licencias_add_column_printed from pg

BEGIN;

ALTER TABLE utentes.licencias DROP COLUMN printed;

COMMIT;
