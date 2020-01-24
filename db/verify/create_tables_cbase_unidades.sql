-- Verify utentes:create_tables_cbase_unidades on pg

BEGIN;

SELECT * FROM cbase.unidades WHERE false;
SELECT * FROM cbase_ara.unidades WHERE false;

SELECT unidade FROM cbase.bacias WHERE false;
SELECT unidade FROM cbase_ara.bacias WHERE false;

ROLLBACK;
