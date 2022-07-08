-- Deploy utentes:alter_tables_inventario_domains_add_app to pg

BEGIN;

ALTER TABLE inventario_dominios.provincia ADD COLUMN app TEXT[];
ALTER TABLE inventario_dominios.distrito ADD COLUMN app TEXT[];
ALTER TABLE inventario_dominios.posto ADD COLUMN app TEXT[];
ALTER TABLE inventario_dominios.bacia ADD COLUMN app TEXT[];
ALTER TABLE inventario_dominios.subacia ADD COLUMN app TEXT[];

UPDATE inventario_dominios.provincia SET app = (SELECT string_to_array(key,';') FROM domains.ara);
UPDATE inventario_dominios.distrito SET app = (SELECT string_to_array(key,';') FROM domains.ara);
UPDATE inventario_dominios.posto SET app = (SELECT string_to_array(key,';') FROM domains.ara);
UPDATE inventario_dominios.bacia SET app = (SELECT string_to_array(key,';') FROM domains.ara);
UPDATE inventario_dominios.subacia SET app = (SELECT string_to_array(key,';') FROM domains.ara);

COMMIT;
