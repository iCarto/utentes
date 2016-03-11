-- Verify create_table_actividades_saneamento

BEGIN;

SELECT gid, exploracao, c_estimado, habitantes
FROM utentes.actividades_saneamento
WHERE FALSE;

ROLLBACK;
