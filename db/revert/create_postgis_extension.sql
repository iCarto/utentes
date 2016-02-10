-- Revert utentes:create_postgis_extension from pg

BEGIN;

DROP EXTENSION postgis;

COMMIT;
