-- Revert utentes:alter_table_exploracaos_add_new_verify_columns_for_previous_fields from pg

BEGIN;

ALTER TABLE utentes.exploracaos 
DROP COLUMN rel_tec_perf_v,
DROP COLUMN bol_an_agua_v;

COMMIT;
