-- Revert create_table_domains_provincia

BEGIN;

DROP TABLE domains.provincia;

COMMIT;
