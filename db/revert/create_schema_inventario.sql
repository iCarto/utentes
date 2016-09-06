-- Revert sixhiara:create_schema_inventario from pg

BEGIN;

DROP SCHEMA inventario CASCADE;

COMMIT;
