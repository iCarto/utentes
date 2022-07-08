-- Revert utentes:create_table_version_inventario from pg

BEGIN;

DROP TABLE inventario.version;

COMMIT;
