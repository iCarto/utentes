-- Revert utentes:create_table_datos_aras from pg

BEGIN;

DROP TABLE utentes.datos_aras;

COMMIT;
