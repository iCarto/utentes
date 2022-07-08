-- Revert create_table_domains_distrito

BEGIN;

DROP TABLE domains.distrito;

COMMIT;
