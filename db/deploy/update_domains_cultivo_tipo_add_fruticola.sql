-- Deploy utentes:update_domains_cultivo_tipo_add_fruticola to pg

BEGIN;

INSERT INTO domains.cultivo_tipo (category, key, value, ordering, parent, tooltip) VALUES ('cultivo_tipo', 'Frutícola', NULL, NULL, NULL, NULL);

COMMIT;
