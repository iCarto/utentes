-- Revert utentes:alter_table_exploracaos_add_lic_imp from pg

BEGIN;

ALTER TABLE utentes.exploracaos DROP COLUMN lic_imp;

COMMIT;
