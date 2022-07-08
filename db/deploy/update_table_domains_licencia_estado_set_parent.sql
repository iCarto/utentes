-- Deploy utentes:update_table_domains_licencia_estado_set_parent to pg

BEGIN;

UPDATE domains.licencia_estado SET parent = 'precampo' WHERE ordering BETWEEN 0 AND 7;
UPDATE domains.licencia_estado SET parent = 'postcampo' WHERE parent is null;

COMMIT;
