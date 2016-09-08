-- Revert sixhiara:create_cartografia_base from pg

BEGIN;

DROP SCHEMA cbase CASCADE;
-- DROP ROLE cbase_read;
-- DROP ROLE cbase_write;

COMMIT;
