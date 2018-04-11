-- Revert utentes:alter_table_analise_name from pg

BEGIN;

ALTER TABLE inventario.fontes_analise RENAME TO analise;

COMMIT;
