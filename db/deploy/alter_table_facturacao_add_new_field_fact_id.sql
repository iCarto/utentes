-- Deploy utentes:alter_table_facturacao_add_new_field_fact_id to pg

BEGIN;

ALTER TABLE utentes.facturacao ADD COLUMN fact_id TEXT UNIQUE;

COMMIT;
