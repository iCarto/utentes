-- Verify create_table_actividades_abastecemento

BEGIN;

SELECT gid, exploracao, c_estimado, habitantes, dotacao
FROM utentes.actividades_abastecemento
WHERE FALSE;

ROLLBACK;
