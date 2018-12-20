-- Verify utentes:alter_table_utentes_add_column_endereco on pg

BEGIN;

SELECT loc_endere FROM utentes.utentes WHERE false;

ROLLBACK;
