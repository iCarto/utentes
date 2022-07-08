-- Revert utentes:public_schema_owner from pg

BEGIN;

-- ALTER SCHEMA public OWNER TO postgres;
-- DROP ROLE utentes;

COMMIT;
