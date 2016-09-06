-- Verify sixhiara:create_owner_user_and_permissions on pg

BEGIN;

SELECT 1 / count(*) FROM information_schema.schemata WHERE schema_name = 'public' AND schema_owner='sixhiara_owner';

SELECT 1 / pg_catalog.has_schema_privilege('sixhiara_owner', 'public', 'usage')::int;

SELECT 1/(pg_catalog.has_schema_privilege('public', 'public', 'usage')::int - 1);

-- TODO. Check: REVOKE ALL ON database sixhiara FROM public;

ROLLBACK;
