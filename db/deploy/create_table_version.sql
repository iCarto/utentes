-- Deploy utentes:create_table_version to pg

BEGIN;

CREATE TABLE utentes.version (
    version text primary key
);

COMMIT;
