-- Revert sixhiara:create_elle from pg

BEGIN;

DROP SCHEMA elle CASCADE;
DROP ROLE elle_read;
DROP ROLE elle_write;

COMMIT;
