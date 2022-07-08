-- Verify utentes:adds_schema_and_table_view_monitor on pg

BEGIN;

SELECT 1/count(*) FROM information_schema.schemata
WHERE schema_name = 'monitoring' AND schema_owner = :'owner';

SELECT * FROM monitoring.view_monitor WHERE false;

ROLLBACK;
