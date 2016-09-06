-- Verify sixhiara:create_roles_inventario on pg

BEGIN;

SELECT 1/count(*) FROM pg_roles WHERE rolname='inventario_read';
SELECT 1/count(*) FROM pg_roles WHERE rolname='inventario_write';

ROLLBACK;
