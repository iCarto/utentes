-- Deploy utentes:alter_table_fontes_add_columns_bacia_font_subacia_font to pg

BEGIN;

ALTER TABLE inventario.fontes ADD COLUMN bacia character varying(254);
ALTER TABLE inventario.fontes ADD COLUMN subacia text;

COMMIT;
