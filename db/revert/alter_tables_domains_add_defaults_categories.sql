-- Revert utentes:alter_tables_inv_domains_add_defaults_categories from pg

BEGIN;

ALTER TABLE inventario_dominios.provincia ALTER COLUMN category DROP DEFAULT;
ALTER TABLE inventario_dominios.posto ALTER COLUMN category DROP DEFAULT;
ALTER TABLE inventario_dominios.distrito ALTER COLUMN category DROP DEFAULT;
ALTER TABLE inventario_dominios.bacia ALTER COLUMN category DROP DEFAULT;
ALTER TABLE inventario_dominios.subacia ALTER COLUMN category DROP DEFAULT;

ALTER TABLE domains.provincia ALTER COLUMN category DROP DEFAULT;
ALTER TABLE domains.posto ALTER COLUMN category DROP DEFAULT;
ALTER TABLE domains.distrito ALTER COLUMN category DROP DEFAULT;
ALTER TABLE domains.bacia ALTER COLUMN category DROP DEFAULT;
ALTER TABLE domains.subacia ALTER COLUMN category DROP DEFAULT;

COMMIT;
