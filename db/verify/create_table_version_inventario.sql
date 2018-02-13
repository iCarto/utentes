-- Verify utentes:create_table_version_inventario on pg

BEGIN;

SELECT * FROM inventario.version WHERE false;

ROLLBACK;
