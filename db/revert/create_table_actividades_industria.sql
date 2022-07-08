-- Revert create_table_actividades_industria

BEGIN;

DROP TABLE utentes.actividades_industria;

COMMIT;
