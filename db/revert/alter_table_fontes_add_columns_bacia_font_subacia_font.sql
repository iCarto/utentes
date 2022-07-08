-- Revert utentes:alter_table_fontes_add_columns_bacia_font_subacia_font from pg

BEGIN;

ALTER TABLE inventario.fontes DROP COLUMN bacia;
ALTER TABLE inventario.fontes DROP COLUMN subacia;

COMMIT;
