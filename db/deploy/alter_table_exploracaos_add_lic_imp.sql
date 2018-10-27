-- Deploy utentes:alter_table_exploracaos_add_lic_print to pg

BEGIN;

ALTER TABLE utentes.exploracaos
    ADD COLUMN lic_imp boolean not null default false;

COMMIT;
