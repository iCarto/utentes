-- Revert utentes:alter_table_domains_boolean_add_unique_constraint from pg

BEGIN;

ALTER TABLE domains.boolean DROP CONSTRAINT boolean_key_key;

COMMIT;
