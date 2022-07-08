-- Revert utentes:alter_table_licencias_add_n_licen_a from pg

BEGIN;

ALTER TABLE utentes.licencias DROP COLUMN n_licen_a;

COMMIT;
