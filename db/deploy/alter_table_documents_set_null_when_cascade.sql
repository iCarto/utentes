-- Deploy utentes:alter_table_documents_set_null_when_cascade to pg

BEGIN;

ALTER TABLE utentes.documentos ALTER COLUMN exploracao DROP NOT NULL;

ALTER TABLE utentes.documentos
    DROP CONSTRAINT documentos_exploracao_fkey,
    ADD CONSTRAINT documentos_exploracao_fkey
        FOREIGN KEY(exploracao) REFERENCES utentes.exploracaos(gid) ON UPDATE RESTRICT ON DELETE SET NULL
;

COMMIT;
