-- Deploy utentes:alter_table_fontes_analise_remove_fonte_rename_comen_lab to pg

BEGIN;

ALTER TABLE inventario.fontes_analise DROP COLUMN fonte;
ALTER TABLE inventario.fontes_analise RENAME COLUMN comen_lab TO obser_lab;

COMMIT;
