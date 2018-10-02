-- Revert utentes:create_table_documentos from pg

BEGIN;

DROP TABLE utentes.documentos;

COMMIT;
