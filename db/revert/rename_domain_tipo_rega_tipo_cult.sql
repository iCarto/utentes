-- Revert utentes:rename_domain_goteo_gota_a_gota from pg

BEGIN;

UPDATE domains.cultivo_tipo SET key = 'Frijol' WHERE key = 'Feijão';
UPDATE domains.cultivo_tipo SET key = 'Maiz' WHERE key = 'Milho';
UPDATE domains.rega_tipo SET key = 'Goteo' WHERE key = 'Gota a gota';
REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
