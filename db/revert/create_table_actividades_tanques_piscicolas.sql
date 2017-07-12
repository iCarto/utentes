-- Revert utentes:create_table_actividade_tanques_piscicolas from pg

BEGIN;

DROP TABLE utentes.actividades_tanques_piscicolas;

COMMIT;
