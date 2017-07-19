-- Deploy utentes:alter_table_domains_boolean_add_unique_constraint to pg

BEGIN;

ALTER TABLE domains.boolean ADD CONSTRAINT boolean_key_key UNIQUE(key); 

COMMIT;
