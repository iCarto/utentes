-- Revert utentes:alter_table_exploracaos_add_cadastro_uni from pg

BEGIN;

ALTER TABLE utentes.exploracaos DROP COLUMN cadastro_uni;
ALTER TABLE utentes.fontes DROP COLUMN cadastro;

COMMIT;
