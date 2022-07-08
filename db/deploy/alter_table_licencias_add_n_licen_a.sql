-- Deploy utentes:alter_table_licencias_add_n_licen_a to pg

BEGIN;

ALTER TABLE utentes.licencias ADD COLUMN n_licen_a TEXT;

COMMIT;
