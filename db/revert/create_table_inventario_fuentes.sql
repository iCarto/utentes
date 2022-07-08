-- Revert utentes:create_table_inventario_fuentes from pg

BEGIN;

DROP TABLE utentes.inventario_fontes;

COMMIT;
