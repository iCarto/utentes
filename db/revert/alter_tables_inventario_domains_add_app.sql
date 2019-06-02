-- Revert utentes:alter_tables_inventario_domains_add_app from pg

BEGIN;

ALTER TABLE inventario_dominios.provincia DROP COLUMN app;
ALTER TABLE inventario_dominios.distrito DROP COLUMN app;
ALTER TABLE inventario_dominios.posto DROP COLUMN app;
ALTER TABLE inventario_dominios.bacia DROP COLUMN app;
ALTER TABLE inventario_dominios.subacia DROP COLUMN app;

COMMIT;
