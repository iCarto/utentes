-- Verify utentes:create_table_cbase_subacias on pg

BEGIN;

SELECT * FROM cbase.subacias WHERE false;
SELECT * FROM cbase_ara.subacias WHERE false;

ROLLBACK;
