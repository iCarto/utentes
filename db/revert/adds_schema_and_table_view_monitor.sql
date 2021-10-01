-- Revert utentes:adds_schema_and_table_view_monitor from pg

BEGIN;

DROP TABLE monitoring.view_monitor;
DROP SCHEMA monitoring;

COMMIT;
