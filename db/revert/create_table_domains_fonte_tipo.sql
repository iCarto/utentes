-- Revert create_table_domains_fonte_tipo

BEGIN;

DROP TABLE domains.fonte_tipo;

COMMIT;
