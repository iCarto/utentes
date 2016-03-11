-- Revert create_table_actividades_saneamento

BEGIN;

DROP TABLE utentes.actividades_saneamento;

COMMIT;
