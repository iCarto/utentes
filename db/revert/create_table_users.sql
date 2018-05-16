-- Revert utentes:create_table_users from pg

BEGIN;

DROP TABLE utentes.users;
DROP TABLE domains.groups;

COMMIT;
