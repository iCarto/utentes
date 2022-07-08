-- Deploy utentes:rename_domain_goteo_gota_a_gota to pg

BEGIN;

UPDATE domains.cultivo_tipo SET key = 'Feijão' WHERE key = 'Frijol';
UPDATE domains.cultivo_tipo SET key = 'Milho' WHERE key = 'Maiz';

UPDATE domains.rega_tipo SET key = 'Gota a gota' WHERE key = 'Goteo';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
