-- Verify utentes:alter_table_exploracaos_add_new_requerimento_documents_1510 on pg

BEGIN;

SELECT
    r_perf
    , b_a_agua
    , r_perf_v
    , b_a_agua_v
FROM utentes.exploracaos
WHERE false;

ROLLBACK;
