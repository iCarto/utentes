-- Revert create_table_actividades_agricultura_rega

BEGIN;

DROP TABLE utentes.actividades_agricultura_rega;

COMMIT;
