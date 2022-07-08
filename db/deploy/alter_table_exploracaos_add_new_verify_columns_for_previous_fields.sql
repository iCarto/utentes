-- Deploy utentes:alter_table_exploracaos_add_new_verify_columns_for_previous_fields to pg

BEGIN;

ALTER TABLE utentes.exploracaos 
ADD COLUMN rel_tec_perf_v boolean not null default false,
ADD COLUMN bol_an_agua_v boolean not null default false;

COMMIT;
