-- Revert sixhiara:create_schema_inventario_dominios from pg

BEGIN;

DROP SCHEMA inventario_dominios CASCADE;

COMMIT;
