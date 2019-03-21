-- Deploy utentes:alter_table_add_column_unidade_to_utentes.users to pg

BEGIN;

ALTER TABLE utentes.users ADD COLUMN unidade text REFERENCES domains.unidade (key);

COMMIT;
