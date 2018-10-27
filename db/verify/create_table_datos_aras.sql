-- Verify utentes:create_table_datos_aras on pg

BEGIN;

SELECT * FROM utentes.datos_aras where false;

ROLLBACK;
