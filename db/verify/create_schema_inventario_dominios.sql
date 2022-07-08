-- Verify sixhiara:create_schema_inventario_dominios on pg

BEGIN;

-- SELECT 1 / count(*) FROM information_schema.schemata WHERE schema_name = 'inventario_dominios' AND schema_owner='sixhiara_owner';
SELECT 1 / count(*) FROM information_schema.schemata WHERE schema_name = 'inventario_dominios';

-- SELECT 1/pg_catalog.has_schema_privilege('sixhiara_owner', 'inventario_dominios', 'usage')::int;
-- SELECT 1/pg_catalog.has_schema_privilege('inventario_read', 'inventario_dominios', 'usage')::int;

-- SELECT 1/(pg_catalog.has_schema_privilege('public', 'inventario_dominios', 'usage')::int - 1);

ROLLBACK;
