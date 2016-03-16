-- Verify create_table_actividades_pecuaria

BEGIN;

SELECT gid, c_estimado
FROM utentes.actividades_pecuaria
WHERE FALSE;

ROLLBACK;
