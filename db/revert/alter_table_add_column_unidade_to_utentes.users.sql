-- Revert utentes:alter_table_add_column_unidade_to_utentes.users from pg

BEGIN;

ALTER TABLE utentes.users DROP COLUMN unidade;

COMMIT;
