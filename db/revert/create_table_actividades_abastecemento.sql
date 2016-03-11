-- Revert create_table_actividades_abastecemento

BEGIN;

DROP TABLE utentes.actividades_abastecemento;

COMMIT;
