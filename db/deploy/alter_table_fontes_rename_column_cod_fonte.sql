-- Deploy utentes:alter_table_fontes_rename_column_cod_fonte to pg

BEGIN;

ALTER TABLE inventario.fontes RENAME COLUMN cod_fonte TO cadastro;
ALTER TABLE inventario.fontes DROP CONSTRAINT IF EXISTS fontes_cod_fonte_key CASCADE;
ALTER TABLE inventario.fontes
  ADD CONSTRAINT fontes_cadastro_key UNIQUE (cadastro);

ALTER TABLE inventario.fontes_imagenes RENAME COLUMN cod_fonte TO cadastro;
ALTER TABLE inventario.fontes_imagenes DROP CONSTRAINT IF EXISTS fontes_imagenes_cod_fonte_fkey;
ALTER TABLE inventario.fontes_imagenes
  ADD CONSTRAINT fontes_imagenes_cadastro_fkey
  FOREIGN KEY (cadastro)
  REFERENCES inventario.fontes(cadastro) MATCH SIMPLE
  ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE inventario.fontes_analise RENAME COLUMN cod_fonte TO cadastro;
ALTER TABLE inventario.fontes_analise DROP CONSTRAINT IF EXISTS fontes_analise_cod_fonte_fkey;
ALTER TABLE inventario.fontes_analise
  ADD CONSTRAINT fontes_analise_cadastro_fkey
  FOREIGN KEY (cadastro)
  REFERENCES inventario.fontes(cadastro) MATCH SIMPLE
  ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE inventario.quantidade_agua RENAME COLUMN cod_fonte TO cadastro;
ALTER TABLE inventario.quantidade_agua DROP CONSTRAINT IF EXISTS quantidade_agua_cod_fonte_fkey;
ALTER TABLE inventario.quantidade_agua
  ADD CONSTRAINT quantidade_agua_cadastro_fkey
  FOREIGN KEY (cadastro)
  REFERENCES inventario.fontes(cadastro) MATCH SIMPLE
  ON UPDATE CASCADE ON DELETE CASCADE;

COMMIT;
