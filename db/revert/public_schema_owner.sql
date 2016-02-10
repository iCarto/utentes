-- Revert utentes:public_schema_owner from pg

BEGIN;

ALTER SCHEMA public OWNER TO utentes;

COMMIT;
