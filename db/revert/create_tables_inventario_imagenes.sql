-- Revert sixhiara:create_tables_inventario_imagenes from pg

BEGIN;

DROP TABLE inventario.fontes_imagenes;
DROP TABLE inventario.acuiferos_imagenes;
DROP TABLE inventario.estacoes_imagenes;
DROP TABLE inventario.barragens_imagenes;

COMMIT;
