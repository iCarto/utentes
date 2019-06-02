-- Verify utentes:rename_domain_goteo_gota_a_gota on pg

BEGIN;

SELECT 1/count(*) FROM domains.rega_tipo WHERE key = 'Gota a gota';
SELECT 1/count(*) FROM domains.cultivo_tipo WHERE key = 'Feijão';
SELECT 1/count(*) FROM domains.cultivo_tipo WHERE key = 'Milho';

ROLLBACK;
