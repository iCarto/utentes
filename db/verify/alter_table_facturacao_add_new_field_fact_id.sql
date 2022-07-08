-- Verify utentes:alter_table_facturacao_add_new_field_fact_id on pg

BEGIN;

SELECT fact_id FROM utentes.facturacao WHERE FALSE;

ROLLBACK;
