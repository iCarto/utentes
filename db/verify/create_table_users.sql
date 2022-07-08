-- Verify utentes:create_table_users on pg

BEGIN;

SELECT category, key, value, ordering, parent, tooltip from domains.groups where false;
SELECT * from utentes.users where false;

ROLLBACK;
