-- Verify utentes:update_inventario_domains_estado on pg

BEGIN;

SELECT 1/count(*) FROM inventario_dominios.estado WHERE key = 'Operacional';

ROLLBACK;
