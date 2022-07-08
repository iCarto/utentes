-- Deploy utentes:alter_table_exploracaos_add_net_column_rel_tec_perf to pg

BEGIN;

ALTER TABLE utentes.exploracaos ADD COLUMN rel_tec_perf boolean not null default false;

COMMIT;
