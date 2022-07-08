-- Deploy utentes:alter_table_fontes_analise_add_new_fields to pg

BEGIN;

ALTER TABLE inventario.fontes_analise ADD COLUMN sulfatos numeric(10,2);
ALTER TABLE inventario.fontes_analise ADD COLUMN fluoreto numeric(10,2);

COMMIT;
