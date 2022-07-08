-- Revert create_table_domains_licencia_tipo

BEGIN;

DROP TABLE domains.licencia_tipo;

COMMIT;
