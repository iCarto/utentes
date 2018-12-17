-- Deploy utentes:alter_exploracaos_add_column_d_ultima_entrega_doc to pg

BEGIN;

ALTER TABLE utentes.exploracaos ADD COLUMN d_ultima_entrega_doc TEXT;

COMMIT;
