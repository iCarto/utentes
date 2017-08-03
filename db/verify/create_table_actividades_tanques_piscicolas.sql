-- Verify utentes:create_table_actividade_tanques_piscicolas on pg

BEGIN;

SELECT 'utentes.calcular_area_m2()'::regprocedure;
SELECT * FROM utentes.actividades_tanques_piscicolas WHERE false;

ROLLBACK;
