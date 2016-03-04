-- Revert create_table_domains_licencia_estado

BEGIN;

DROP TABLE domains.licencia_estado;

COMMIT;
