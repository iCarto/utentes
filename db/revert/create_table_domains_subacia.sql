-- Revert create_table_domains_subacia

BEGIN;

DROP TABLE domains.subacia;

COMMIT;
