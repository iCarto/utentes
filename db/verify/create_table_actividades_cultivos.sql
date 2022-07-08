-- Verify create_table_actividades_cultivos

BEGIN;

SELECT gid, cult_id, actividade, c_estimado, cultivo, rega, eficiencia, area, observacio, the_geom
FROM utentes.actividades_cultivos
WHERE FALSE;

ROLLBACK;
