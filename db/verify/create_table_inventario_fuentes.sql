-- Verify utentes:create_table_inventario_fuentes on pg

BEGIN;

SELECT * from utentes.inventario_fontes;

ROLLBACK;
