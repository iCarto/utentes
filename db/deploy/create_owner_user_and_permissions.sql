-- Deploy sixhiara:create_owner_user_and_permissions to pg

BEGIN;

CREATE ROLE sixhiara_owner WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN NOREPLICATION;

REVOKE ALL ON schema public FROM public;
REVOKE ALL ON database sixhiara FROM public;

ALTER SCHEMA public OWNER TO sixhiara_owner;

-- GRANT ALL PRIVILEGES ON DATABASE hostdb TO hostdb_admin;

COMMIT;
