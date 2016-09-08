-- Verify sixhiara:create_schema_inventario on pg

BEGIN;

-- SELECT 1 / count(*) FROM information_schema.schemata WHERE schema_name = 'inventario' AND schema_owner='sixhiara_owner';
SELECT 1 / count(*) FROM information_schema.schemata WHERE schema_name = 'inventario';

-- SELECT 1/pg_catalog.has_schema_privilege('sixhiara_owner', 'inventario', 'usage')::int;
-- SELECT 1/pg_catalog.has_schema_privilege('inventario_read', 'inventario', 'usage')::int;

-- SELECT 1/(pg_catalog.has_schema_privilege('public', 'inventario', 'usage')::int - 1);


ROLLBACK;
