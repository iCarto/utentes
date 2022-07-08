-- Verify utentes:alter_table_exploracaos_add_net_column_rel_tec_perf on pg

BEGIN;

SELECT rel_tec_perf FROM utentes.exploracaos WHERE false;

ROLLBACK;
