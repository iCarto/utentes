-- Verify create_table_actividades_agricultura_rega

BEGIN;

SELECT gid, c_estimado
FROM utentes.actividades_agricultura_rega
WHERE FALSE;

ROLLBACK;
