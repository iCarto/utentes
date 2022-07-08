-- Revert create_table_actividades_piscicultura

BEGIN;

DROP TABLE utentes.actividades_piscicultura;

COMMIT;
