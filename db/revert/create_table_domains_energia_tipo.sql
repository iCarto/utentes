-- Revert create_table_domains_energia_tipo

BEGIN;

DROP TABLE domains.energia_tipo;

COMMIT;
