-- Revert utentes:update_inventario_domains_estado from pg

BEGIN;

UPDATE inventario_dominios.estado
SET key = 'Bo'
WHERE key = 'Operacional';

COMMIT;
