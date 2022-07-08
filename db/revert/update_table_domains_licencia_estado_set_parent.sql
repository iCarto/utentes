-- Revert utentes:update_table_domains_licencia_estado_set_parent from pg

BEGIN;

update domains.licencia_estado set parent = null;

COMMIT;
