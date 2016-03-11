-- Verify create_table_actividades_produccao_energia

BEGIN;

SELECT gid, c_estimado, tipo, alt_agua, potencia, equipo, eval_impac
FROM utentes.actividades_produccao_energia
WHERE FALSE;

ROLLBACK;
