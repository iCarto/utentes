-- Deploy utentes:alter_exploracaos_add_column_d_ultima_entrega_doc to pg

BEGIN;

ALTER TABLE utentes.exploracaos ADD COLUMN d_ultima_entrega_doc DATE;

UPDATE utentes.exploracaos SET d_soli = created_at where d_soli is null;
UPDATE utentes.exploracaos SET d_ultima_entrega_doc = d_soli;

COMMIT;
