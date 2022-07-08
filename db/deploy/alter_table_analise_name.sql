-- Deploy utentes:alter_table_analise_name to pg

BEGIN;

ALTER TABLE inventario.analise RENAME TO fontes_analise;

COMMIT;
