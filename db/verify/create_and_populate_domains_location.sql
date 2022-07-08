-- Verify sixhiara:create_and_populate_domains_location on pg

BEGIN;

SELECT category, key, value, ordering, parent, tooltip FROM inventario_dominios.bacia WHERE false;
SELECT category, key, value, ordering, parent, tooltip FROM inventario_dominios.distrito WHERE false;
SELECT category, key, value, ordering, parent, tooltip FROM inventario_dominios.posto WHERE false;
SELECT category, key, value, ordering, parent, tooltip FROM inventario_dominios.provincia WHERE false;
SELECT category, key, value, ordering, parent, tooltip FROM inventario_dominios.subacia WHERE false;

ROLLBACK;
