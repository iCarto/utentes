-- Revert sixhiara:create_roles_inventario from pg

BEGIN;

-- DROP ROLE inventario_read;
-- DROP ROLE inventario_write;

COMMIT;
