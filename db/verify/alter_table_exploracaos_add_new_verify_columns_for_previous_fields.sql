-- Verify utentes:alter_table_exploracaos_add_new_verify_columns_for_previous_fields on pg

BEGIN;

SELECT bol_an_agua_v, rel_tec_perf_v FROM utentes.exploracaos WHERE false;

ROLLBACK;
