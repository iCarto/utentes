-- Verify utentes:update_domains_distrito_change_pemba on pg

BEGIN;

SELECT 1/count(*) FROM domains.distrito
WHERE (category, key, parent) = ('distrito', 'Pemba - Metuge', 'Cabo Delgado');

ROLLBACK;
