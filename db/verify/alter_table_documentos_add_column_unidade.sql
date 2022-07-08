-- Verify utentes:alter_table_documentos_add_column_unidade on pg

BEGIN;

SELECT unidade FROM utentes.documentos WHERE FALSE;

ROLLBACK;
