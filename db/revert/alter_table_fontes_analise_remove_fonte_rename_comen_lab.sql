-- Revert utentes:alter_table_fontes_analise_remove_fonte_rename_comen_lab from pg

BEGIN;

ALTER TABLE inventario.fontes_analise ADD COLUMN fonte text;
ALTER TABLE inventario.fontes_analise RENAME COLUMN obser_lab TO comen_lab;

COMMIT;
