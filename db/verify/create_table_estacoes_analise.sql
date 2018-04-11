-- Verify utentes:create_table_estacoes_analise on pg

BEGIN;

SELECT 1/ count(*) FROM information_schema.tables where table_name='estacoes_analise';

ROLLBACK;
