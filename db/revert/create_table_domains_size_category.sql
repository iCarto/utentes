-- Revert utentes:create_table_domains_size_category from pg

BEGIN;

DROP TABLE domains.size_category;

COMMIT;
