-- Verify utentes:alter_table_fontes_rename_column_cod_fonte on pg

BEGIN;

SELECT cadastro FROM inventario.fontes WHERE FALSE;
SELECT cadastro FROM inventario.fontes_imagenes WHERE FALSE;
SELECT cadastro FROM inventario.fontes_analise WHERE FALSE;
SELECT cadastro FROM inventario.quantidade_agua WHERE FALSE;

SELECT  1/count(*) FROM information_schema.table_constraints
  WHERE constraint_name = 'fontes_cadastro_key';
SELECT  1/count(*) FROM information_schema.table_constraints
  WHERE constraint_name = 'fontes_imagenes_cadastro_fkey';
SELECT  1/count(*) FROM information_schema.table_constraints
  WHERE constraint_name = 'fontes_analise_cadastro_fkey';
SELECT  1/count(*) FROM information_schema.table_constraints
  WHERE constraint_name = 'quantidade_agua_cadastro_fkey';

ROLLBACK;
