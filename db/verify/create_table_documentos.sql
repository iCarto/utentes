-- Verify utentes:create_table_documentos on pg

BEGIN;

SELECT gid, name, departamento
FROM utentes.documentos
WHERE FALSE;

ROLLBACK;
