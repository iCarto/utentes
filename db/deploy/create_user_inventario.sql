-- Deploy sixhiara:create_user_inventario to pg

BEGIN;

-- CREATE ROLE inventario WITH NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN NOREPLICATION;
-- GRANT cbase_read TO inventario;
-- GRANT elle_read TO inventario;
-- GRANT elle_write TO inventario;
-- GRANT inventario_read TO inventario;
-- GRANT inventario_write TO inventario;

COMMIT;
