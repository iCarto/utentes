-- Deploy utentes:drop_trigger_calculate_area_exploracao to pg

BEGIN;

DROP TRIGGER calcular_area ON utentes.exploracaos;
DROP TRIGGER calcular_area ON utentes.actividades_cultivos;

DROP FUNCTiON utentes.calcular_area();

COMMIT;
