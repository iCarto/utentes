-- Revert utentes:create_table_domains_ara from pg

BEGIN;

DROP TABLE domains.ara;

COMMIT;
