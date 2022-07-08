-- Revert create_table_actividades_produccao_energia

BEGIN;

DROP TABLE utentes.actividades_produccao_energia;

COMMIT;
