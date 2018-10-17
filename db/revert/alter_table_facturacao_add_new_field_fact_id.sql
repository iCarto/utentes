-- Revert utentes:alter_table_facturacao_add_new_field_fact_id from pg

BEGIN;

ALTER TABLE utentes.facturacao DROP COLUMN fact_id;

COMMIT;
