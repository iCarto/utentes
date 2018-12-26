-- Revert utentes:alter_table_exploracaos_add_cadastro_uni from pg

BEGIN;

ALTER TABLE utentes.licencias ADD COLUMN cadastro TEXT;
UPDATE utentes.licencias l SET cadastro = (SELECT l.cadastro_uni FROM utentes.exploracaos e WHERE e.gid = l.exploracao LIMIT 1);
ALTER TABLE utentes.exploracaos DROP COLUMN cadastro_uni;
ALTER TABLE utentes.fontes DROP COLUMN cadastro;


COMMIT;
