-- Verify create_table_actividades_piscicultura

BEGIN;

SELECT gid, exploracao, c_estimado, area, v_reservas
FROM utentes.actividades_piscicultura
WHERE FALSE;

ROLLBACK;
