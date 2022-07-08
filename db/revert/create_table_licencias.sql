-- Revert create_table_licencias

BEGIN;

DROP TABLE utentes.licencias;

COMMIT;
