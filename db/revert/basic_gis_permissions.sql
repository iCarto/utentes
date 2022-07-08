-- Revert utentes:basic_gis_permissions from pg

BEGIN;

DROP OWNED BY sirha_base_user;
DROP ROLE tecnico;
DROP ROLE sirha_base_user;

COMMIT;
