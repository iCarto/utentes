-- Verify exploracaos_add_column_actividade

BEGIN;

SELECT actividade FROM utentes.exploracaos WHERE FALSE;

ROLLBACK;
