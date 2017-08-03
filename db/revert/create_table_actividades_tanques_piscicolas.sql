-- Revert utentes:create_table_actividade_tanques_piscicolas from pg

BEGIN;

DROP TRIGGER calcular_area_m2 ON utentes.actividades_tanques_piscicolas;
DROP FUNCTION utentes.calcular_area_m2();
DROP TABLE utentes.actividades_tanques_piscicolas;

COMMIT;
