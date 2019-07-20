-- Revert utentes:new_column_tipo_aqui_to_analise_fonte from pg

BEGIN;

ALTER TABLE inventario.fontes_analise DROP COLUMN tipo_aqui;

COMMIT;
