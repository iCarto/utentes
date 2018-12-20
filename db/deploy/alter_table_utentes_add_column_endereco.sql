-- Deploy utentes:alter_table_utentes_add_column_endereco to pg

BEGIN;

ALTER TABLE utentes.utentes ADD COLUMN loc_endere TEXT ;

COMMIT;
