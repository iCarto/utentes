-- Revert create_table_domains_actividade

BEGIN;

DROP TABLE domains.actividade;

COMMIT;
