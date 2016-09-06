-- Verify sixhiara:create_tables_inventario_imagenes on pg

BEGIN;

SELECT cod_fonte, image FROM inventario.fontes_imagenes WHERE false;
SELECT cod_acuif, image FROM inventario.acuiferos_imagenes WHERE false;
SELECT cod_estac, image FROM inventario.estacoes_imagenes WHERE false;
SELECT cod_barra, image FROM inventario.barragens_imagenes WHERE false;

ROLLBACK;
