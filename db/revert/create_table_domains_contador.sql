-- Revert create_table_domains_contador

BEGIN;

DROP TABLE domains.contador;

COMMIT;
