-- Deploy utentes:alter_table_fontes_add_columns_bacia_font_subacia_font to pg

BEGIN;

ALTER TABLE inventario.fontes ADD COLUMN bacia character varying(254);
ALTER TABLE inventario.fontes ADD COLUMN subacia text;

ALTER TABLE inventario.fontes
   ADD CONSTRAINT fontes_bacia_fkey
   FOREIGN KEY (bacia)
   REFERENCES inventario_dominios.bacia(key) ON UPDATE CASCADE;

ALTER TABLE inventario.fontes
    ADD CONSTRAINT fontes_subacia_fkey
    FOREIGN KEY (bacia, subacia) 
    REFERENCES inventario_dominios.subacia(parent, key) ON UPDATE CASCADE;

COMMIT;
