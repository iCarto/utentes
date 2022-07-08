-- Revert utentes:alter_table_exploracaos_add_new_requerimento_documents_1510 from pg

BEGIN;

ALTER TABLE utentes.exploracaos
    DROP COLUMN r_perf,
    DROP COLUMN b_a_agua,
    DROP COLUMN r_perf_v,
    DROP COLUMN b_a_agua_v
;

COMMIT;
