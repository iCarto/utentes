-- Revert create_table_settings

BEGIN;

DROP TABLE utentes.settings;

COMMIT;
