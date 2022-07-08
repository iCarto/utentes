-- Revert utentes:delete_column_exploracao_fact_estado from pg

BEGIN;

ALTER TABLE utentes.exploracaos ADD COLUMN fact_estado TEXT NOT NULL REFERENCES domains.facturacao_fact_estado(key) ON UPDATE CASCADE ON DELETE NO ACTION;

COMMIT;
