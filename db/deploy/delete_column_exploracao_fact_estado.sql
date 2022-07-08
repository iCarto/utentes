-- Deploy utentes:delete_column_exploracao_fact_estado to pg

BEGIN;

ALTER TABLE utentes.exploracaos DROP COLUMN fact_estado;

COMMIT;
