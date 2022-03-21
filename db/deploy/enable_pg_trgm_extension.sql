-- Deploy utentes:enable_pg_trgm_extension to pg

BEGIN;

CREATE EXTENSION pg_trgm;

COMMIT;
