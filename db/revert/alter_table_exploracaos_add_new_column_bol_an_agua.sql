-- Revert utentes:alter_table_exploracaos_add_new_column_bol_an_agua from pg

BEGIN;

ALTER TABLE utentes.exploracaos DROP COLUMN bol_an_agua;

COMMIT;
