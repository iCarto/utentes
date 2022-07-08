-- Revert utentes:alter_table_exploracaos_add_net_column_rel_tec_perf from pg

BEGIN;

ALTER TABLE utentes.exploracaos DROP COLUMN rel_tec_perf;

COMMIT;
