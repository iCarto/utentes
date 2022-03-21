-- Revert utentes:enable_pg_trgm_extension from pg

BEGIN;

DROP EXTENSION pg_trgm;

COMMIT;
