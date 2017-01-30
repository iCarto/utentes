-- Revert utentes:create_trigger_calculate_area_exploracao from pg

BEGIN;

DROP TRIGGER calcular_area ON utentes.exploracaos;
DROP TRIGGER calcular_area ON utentes.actividades_cultivos;
DROP FUNCTION utentes.calcular_area();

COMMIT;
