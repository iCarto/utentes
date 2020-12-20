-- Revert utentes:create_table_cbase_unidades_weap from pg

BEGIN;

DROP TABLE cbase.unidades_weap;
DROP TABLE cbase_ara.unidades_weap;

COMMIT;
