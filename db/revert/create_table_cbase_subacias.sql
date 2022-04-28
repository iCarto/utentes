-- Revert utentes:create_table_cbase_subacias from pg

BEGIN;

DROP TABLE cbase_ara.subacias;
DROP TABLE cbase.subacias;

COMMIT;
