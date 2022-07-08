-- Revert utentes:alter_table_fontes_analise_add_new_fields from pg

BEGIN;

ALTER TABLE inventario.fontes_analise DROP COLUMN sulfatos;
ALTER TABLE inventario.fontes_analise DROP COLUMN fluoreto;

COMMIT;
