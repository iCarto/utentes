-- Revert create_table_domains_posto

BEGIN;

DROP TABLE domains.posto;

COMMIT;
