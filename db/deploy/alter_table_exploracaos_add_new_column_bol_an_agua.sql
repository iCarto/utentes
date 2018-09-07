-- Deploy utentes:alter_table_exploracaos_add_new_column_bol_an_agua to pg

BEGIN;

ALTER TABLE utentes.exploracaos ADD COLUMN bol_an_agua boolean not null default false;

COMMIT;
