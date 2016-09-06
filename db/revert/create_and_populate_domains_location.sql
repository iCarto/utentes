-- Revert sixhiara:create_and_populate_domains_location from pg

BEGIN;

DROP TABLE inventario_dominios.bacia;
DROP TABLE inventario_dominios.distrito;
DROP TABLE inventario_dominios.posto;
DROP TABLE inventario_dominios.provincia;
DROP TABLE inventario_dominios.subacia;


COMMIT;
