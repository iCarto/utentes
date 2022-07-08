-- Verify utentes:alter_table_analise_name on pg

BEGIN;

SELECT 1/ count(*) FROM information_schema.tables where table_name='fontes_analise';

ROLLBACK;
