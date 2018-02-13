-- Deploy utentes:create_table_version_inventario to pg

BEGIN;

CREATE TABLE inventario.version (
    version text primary key
);

COMMIT;
