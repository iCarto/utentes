-- Deploy utentes:public_schema_owner to pg

BEGIN;

ALTER SCHEMA public OWNER TO utentes;

COMMIT;
