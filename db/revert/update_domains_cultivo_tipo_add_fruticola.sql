-- Revert utentes:update_domains_cultivo_tipo_add_fruticola from pg

BEGIN;

DELETE FROM domains.cultivo_tipo WHERE (category, key) = ('cultivo_tipo', 'Frutícola');

COMMIT;
