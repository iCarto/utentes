-- Revert create_schema_domains

BEGIN;

DROP SCHEMA domains;

COMMIT;
