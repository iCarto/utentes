-- Revert sixhiara:create_owner_user_and_permissions from pg

BEGIN;

ALTER SCHEMA public OWNER TO postgres;
GRANT ALL ON schema public TO public;
GRANT ALL ON database sixhiara TO public;
DROP ROLE sixhiara_owner;

COMMIT;
