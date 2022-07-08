-- Verify utentes:moves_c_estimado_to_actividade on pg

BEGIN;

SELECT c_estimado FROM utentes.actividades;

ROLLBACK;
