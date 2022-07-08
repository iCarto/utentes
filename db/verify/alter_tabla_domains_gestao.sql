-- Verify utentes:alter_tabla_domains_gestao on pg

BEGIN;

SELECT 1/count(*) FROM inventario_dominios.gestao WHERE key = 'ARA';
SELECT 1/count(*) FROM inventario_dominios.gestao WHERE key = 'DNGRH';

ROLLBACK;
