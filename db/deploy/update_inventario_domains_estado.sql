-- Deploy utentes:update_inventario_domains_estado to pg

BEGIN;

UPDATE inventario_dominios.estado
SET key = 'Operacional'
WHERE key = 'Bo';

COMMIT;
