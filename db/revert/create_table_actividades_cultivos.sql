-- Revert create_table_actividades_cultivos

BEGIN;

DROP TABLE utentes.actividades_cultivos;

COMMIT;
