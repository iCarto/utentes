-- Verify utentes:create_trigger_calculate_area_exploracao on pg

BEGIN;

SELECT 'utentes.calcular_area()'::regprocedure;

ROLLBACK;
