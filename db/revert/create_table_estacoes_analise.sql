-- Revert utentes:create_table_estacoes_analise from pg

BEGIN;

DROP TABLE inventario.estacoes_analise;

COMMIT;
