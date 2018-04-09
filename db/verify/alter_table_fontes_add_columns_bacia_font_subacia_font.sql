-- Verify utentes:alter_table_fontes_add_columns_bacia_font_subacia_font on pg

BEGIN;

SELECT bacia FROM inventario.fontes;
SELECT subacia FROM inventario.fontes;

ROLLBACK;
