-- Revert utentes:create_table_version from pg

BEGIN;

DROP TABLE utentes.version;

COMMIT;
