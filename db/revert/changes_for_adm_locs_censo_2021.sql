-- Revert utentes:changes_for_adm_locs_censo_2021 from pg

BEGIN;

ALTER TABLE cbase.provincias ADD COLUMN censo_2007 integer;
ALTER TABLE cbase_ara.provincias ADD COLUMN censo_2007 integer;

ALTER TABLE cbase.distritos ADD COLUMN censo_2007 integer;
ALTER TABLE cbase_ara.distritos ADD COLUMN censo_2007 integer;

ALTER TABLE cbase.postos ADD COLUMN censo_2007 integer;
ALTER TABLE cbase_ara.postos ADD COLUMN censo_2007 integer;

DROP FUNCTION utentes.extract_discriminator_from_ara_name_list(text);

COMMIT;
