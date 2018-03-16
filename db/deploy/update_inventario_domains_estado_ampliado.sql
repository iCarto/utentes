-- Deploy utentes:update_inventario_domains_estado_ampliado to pg

BEGIN;

UPDATE inventario_dominios.estado_ampliado
SET key = 'Operacional'
WHERE key = 'Bo';

COMMIT;
