-- Revert utentes:changes_for_inventario_tables_201905 from pg

BEGIN;

ALTER TABLE inventario.fontes DROP CONSTRAINT fontes_loc_unidad_fkey;
ALTER TABLE inventario.fontes ADD CONSTRAINT fontes_loc_unidad_fkey FOREIGN KEY (loc_unidad) REFERENCES domains.unidade(key);
DROP TABLE inventario_dominios.unidade;

COMMIT;
