-- Verify utentes:update_domains_cultivo_tipo_add_fruticola on pg

BEGIN;

SELECT 1/count(*) FROM domains.cultivo_tipo WHERE (category, key) = ('cultivo_tipo', 'Frutícola');

ROLLBACK;
