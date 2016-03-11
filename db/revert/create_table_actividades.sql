-- Revert create_table_actividades

BEGIN;

DROP TABLE utentes.actividades;

COMMIT;
