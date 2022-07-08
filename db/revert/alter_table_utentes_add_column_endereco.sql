-- Revert utentes:alter_table_utentes_add_column_endereco from pg

BEGIN;

ALTER TABLE utentes.utentes DROP COLUMN loc_endere;

COMMIT;
