-- Deploy utentes:changes_for_adm_locs_censo_2021 to pg

BEGIN;

ALTER TABLE cbase.provincias DROP COLUMN censo_2007;
ALTER TABLE cbase_ara.provincias DROP COLUMN censo_2007;

ALTER TABLE cbase.distritos DROP COLUMN censo_2007;
ALTER TABLE cbase_ara.distritos DROP COLUMN censo_2007;

ALTER TABLE cbase.postos DROP COLUMN censo_2007;
ALTER TABLE cbase_ara.postos DROP COLUMN censo_2007;

ALTER TABLE table cbase_ara.provincias_outras drop column censo_2007;

CREATE OR REPLACE FUNCTION utentes.extract_discriminator_from_ara_name_list(text) RETURNS setof text AS $f$
    -- Column 'ara' in cbase schema is like 'ARA-Centro, IP; ARA-Sul, IP'
    -- This returns a setof like:
    -- 'Centro'
    -- 'Sul'
    -- useful to match between the full names and domains.ara.value for the views
    SELECT replace(replace(trim(unnest(string_to_array($1, ';'))), 'ARA-', ''), ', IP', '');
$f$ LANGUAGE SQL IMMUTABLE;


COMMIT;
