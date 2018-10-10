-- Revert utentes:alter_table_documents_set_null_when_cascade from pg

BEGIN;

ALTER TABLE utentes.documentos ALTER COLUMN exploracao SET NOT NULL;

ALTER TABLE utentes.documentos
    DROP CONSTRAINT documentos_exploracao_fkey,
    ADD CONSTRAINT documentos_exploracao_fkey
        FOREIGN KEY(exploracao) REFERENCES utentes.exploracaos(gid)
;


COMMIT;
