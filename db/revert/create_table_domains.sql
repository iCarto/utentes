-- Revert create_table_domains

BEGIN;

DROP TABLE utentes.domains;

COMMIT;
