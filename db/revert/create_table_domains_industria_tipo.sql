-- Revert create_table_domains_industria_tipo

BEGIN;

DROP TABLE domains.industria_tipo;

COMMIT;
