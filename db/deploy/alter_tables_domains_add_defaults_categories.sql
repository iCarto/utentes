-- Deploy utentes:alter_tables_inv_domains_add_defaults_categories to pg

BEGIN;

ALTER TABLE inventario_dominios.provincia ALTER COLUMN category SET DEFAULT 'provincia';
ALTER TABLE inventario_dominios.posto ALTER COLUMN category SET DEFAULT 'posto';
ALTER TABLE inventario_dominios.distrito ALTER COLUMN category SET DEFAULT 'distrito';
ALTER TABLE inventario_dominios.bacia ALTER COLUMN category SET DEFAULT 'bacia';
ALTER TABLE inventario_dominios.subacia ALTER COLUMN category SET DEFAULT 'subacia';

ALTER TABLE domains.provincia ALTER COLUMN category SET DEFAULT 'provincia';
ALTER TABLE domains.posto ALTER COLUMN category SET DEFAULT 'posto';
ALTER TABLE domains.distrito ALTER COLUMN category SET DEFAULT 'distrito';
ALTER TABLE domains.bacia ALTER COLUMN category SET DEFAULT 'bacia';
ALTER TABLE domains.subacia ALTER COLUMN category SET DEFAULT 'subacia';

COMMIT;
