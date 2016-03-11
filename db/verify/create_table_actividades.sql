-- Verify create_table_actividades

BEGIN;

SELECT gid, exploracao, tipo
FROM utentes.actividades
WHERE FALSE;

ROLLBACK;
