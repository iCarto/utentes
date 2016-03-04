-- Revert create_table_domains_rega_tipo

BEGIN;

DROP TABLE domains.rega_tipo;

COMMIT;
