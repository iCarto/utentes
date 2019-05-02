-- Deploy utentes:alter_table_facturacao_add_column_juro to pg

BEGIN;

ALTER TABLE utentes.facturacao ADD COLUMN juros numeric(10,2) not null default 0;

COMMIT;
