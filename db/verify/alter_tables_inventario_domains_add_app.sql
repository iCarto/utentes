-- Verify utentes:alter_tables_inventario_domains_add_app on pg

BEGIN;

SELECT 1/count(*) FROM domains.ara a JOIN inventario_dominios.provincia p ON a.key = ANY(p.app);
SELECT 1/count(*) FROM domains.ara a JOIN inventario_dominios.distrito p ON a.key = ANY(p.app);
SELECT 1/count(*) FROM domains.ara a JOIN inventario_dominios.posto p ON a.key = ANY(p.app);
SELECT 1/count(*) FROM domains.ara a JOIN inventario_dominios.bacia p ON a.key = ANY(p.app);
SELECT 1/count(*) FROM domains.ara a JOIN inventario_dominios.subacia p ON a.key = ANY(p.app);

ROLLBACK;
