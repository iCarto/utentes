-- Verify utentes:new_column_tipo_aqui_to_analise_fonte on pg

BEGIN;

SELECT tipo_aqui FROM inventario.fontes_analise WHERE false;

ROLLBACK;
