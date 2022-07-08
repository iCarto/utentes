-- Revert utentes:alter_exploracaos_add_column_d_ultima_entrega_doc from pg

BEGIN;

ALTER TABLE utentes.exploracaos DROP COLUMN d_ultima_entrega_doc;

COMMIT;
