-- Verify utentes:update_inventario_domains_estado_ampliado on pg

BEGIN;

SELECT 1/count(*) FROM inventario_dominios.estado_ampliado WHERE key = 'Operacional';

ROLLBACK;
