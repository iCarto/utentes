-- Verify create_table_actividades_reses

BEGIN;

SELECT gid, actividade, c_estimado, reses_tipo, reses_nro, c_res, observacio
FROM utentes.actividades_reses
WHERE FALSE;

ROLLBACK;
