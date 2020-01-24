-- Revert utentes:create_tables_cbase_unidades from pg

BEGIN;

ALTER TABLE cbase_ara.bacias DROP COLUMN unidade;
ALTER TABLE cbase.bacias DROP COLUMN unidade;

DROP TABLE cbase_ara.unidades;
DROP TABLE cbase.unidades;

COMMIT;
