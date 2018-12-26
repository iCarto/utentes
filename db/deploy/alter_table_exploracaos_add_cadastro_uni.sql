-- Deploy utentes:alter_table_exploracaos_add_cadastro_uni to pg

BEGIN;

ALTER TABLE utentes.exploracaos ADD COLUMN cadastro_uni TEXT;
UPDATE utentes.exploracaos e SET cadastro_uni = (SELECT l.cadastro FROM utentes.licencias l WHERE e.gid = l.exploracao LIMIT 1);
ALTER TABLE utentes.fontes ADD COLUMN cadastro TEXT;

ALTER TABLE utentes.licencias DROP COLUMN cadastro;

COMMIT;
