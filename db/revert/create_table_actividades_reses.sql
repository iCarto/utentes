-- Revert create_table_actividades_reses

BEGIN;

DROP TABLE utentes.actividades_reses;

COMMIT;
