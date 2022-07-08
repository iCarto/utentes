-- Revert utentes:update_inventario_domains_estado_ampliado from pg

BEGIN;

UPDATE inventario_dominios.estado_ampliado
SET key = 'Bo'
WHERE key = 'Operacional';

COMMIT;
