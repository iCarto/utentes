-- Verify sixhiara:create_cartografia_base on pg

BEGIN;

-- SELECT 1 / count(*) FROM information_schema.schemata WHERE schema_name = 'cbase' AND schema_owner='sixhiara_owner';
SELECT 1 / count(*) FROM information_schema.schemata WHERE schema_name = 'cbase';

-- SELECT 1/pg_catalog.has_schema_privilege('sixhiara_owner', 'cbase', 'usage')::int;
-- SELECT 1/pg_catalog.has_schema_privilege('cbase_read', 'cbase', 'usage')::int;
-- SELECT 1/pg_catalog.has_schema_privilege('cbase_write', 'cbase', 'create')::int;

-- SELECT 1/(pg_catalog.has_schema_privilege('public', 'cbase', 'usage')::int - 1);

ROLLBACK;
