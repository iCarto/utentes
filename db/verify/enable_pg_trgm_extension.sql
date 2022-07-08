-- Verify utentes:enable_pg_trgm_extension on pg

BEGIN;

SELECT 1/count(*) FROM pg_extension WHERE extname = 'pg_trgm';

ROLLBACK;
