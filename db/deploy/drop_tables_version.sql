-- Deploy utentes:drop_tables_version to pg

BEGIN;

DROP TABLE utentes.version;
DROP TABLE inventario.version;

COMMIT;
