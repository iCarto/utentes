-- Revert create_table_utentes

BEGIN;

DROP TABLE utentes.utentes;

COMMIT;
