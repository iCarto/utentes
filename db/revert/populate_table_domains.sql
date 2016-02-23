-- Revert utentes:populate_table_domains from pg

BEGIN;

DELETE FROM utentes.domains;

COMMIT;
