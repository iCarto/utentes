-- Verify utentes:public_schema_owner on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('utentes', 'public', 'usage');
SELECT 1/count(*) FROM information_schema.schemata WHERE schema_name = 'public' AND schema_owner = 'utentes';

ROLLBACK;
