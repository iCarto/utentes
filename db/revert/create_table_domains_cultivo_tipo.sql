-- Revert create_table_domains_cultivo_tipo

BEGIN;

DROP TABLE domains.cultivo_tipo;

COMMIT;
