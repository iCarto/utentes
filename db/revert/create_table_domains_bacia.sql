-- Revert create_table_domains_bacia

BEGIN;

DROP TABLE domains.bacia;

COMMIT;
