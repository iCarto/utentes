-- Verify utentes:alter_table_utentes.licencias_add_column_printed on pg

BEGIN;

SELECT printed FROM utentes.licencias WHERE FALSE;

ROLLBACK;
