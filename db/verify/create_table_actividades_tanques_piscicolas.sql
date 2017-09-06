-- Verify utentes:create_table_actividade_tanques_piscicolas on pg

BEGIN;

SELECT * FROM utentes.actividades_tanques_piscicolas WHERE false;

ROLLBACK;
