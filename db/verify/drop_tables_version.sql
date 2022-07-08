-- Verify utentes:drop_tables_version on pg

BEGIN;

SELECT 1/(count(*)-1) FROM information_schema.tables
WHERE table_schema = 'utentes' AND table_name='version';

SELECT 1/(count(*)-1) FROM information_schema.tables
WHERE table_schema = 'inventario' AND table_name='version';

ROLLBACK;
