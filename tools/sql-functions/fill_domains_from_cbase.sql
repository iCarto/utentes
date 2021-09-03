CREATE OR REPLACE FUNCTION utentes.extract_discriminator_from_ara_name_list(text) RETURNS setof text AS $f$
    -- Column 'ara' in cbase schema is like 'ARA-Centro, IP; ARA-Sul, IP'
    -- This returns a setof like:
    -- 'Centro'
    -- 'Sul'
    -- useful to match between the full names and domains.ara.value for the views
    SELECT replace(replace(trim(unnest(string_to_array($1, ';'))), 'ARA-', ''), ', IP', '');
$f$ LANGUAGE SQL IMMUTABLE;


--
-- ute_domains_loc_adm
--

ALTER TABLE domains.provincia  ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE domains.distrito  ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE domains.posto  ADD COLUMN antigua text not null default 'nueva';
UPDATE domains.provincia SET antigua = 'antigua';
UPDATE domains.distrito SET antigua = 'antigua';
UPDATE domains.posto SET antigua = 'antigua';
ALTER TABLE domains.provincia  ADD COLUMN ara text;
ALTER TABLE domains.distrito  ADD COLUMN ara text;
ALTER TABLE domains.posto  ADD COLUMN ara text;



INSERT INTO domains.provincia as a (key, ara)
    SELECT nome, ara FROM cbase.provincias
    ON CONFLICT ON CONSTRAINT provincia_key_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH
foo as (
    select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM domains.provincia
)
, bar AS (
    select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent
)
update domains.provincia p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');



INSERT INTO domains.distrito as a (key, parent, ara)
    SELECT nome, loc_provin, ara FROM cbase.distritos
    ON CONFLICT ON CONSTRAINT distrito_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH foo as (select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM domains.distrito), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update domains.distrito p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');


INSERT INTO domains.posto as a(key, parent, ara)
    SELECT nome, loc_distri, ara FROM cbase.postos
    ON CONFLICT ON CONSTRAINT posto_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH foo as (select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM domains.posto), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update domains.posto p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');


-- AJUSTES A MANO


DELETE FROM domains.provincia WHERE antigua = 'antigua';
DELETE FROM domains.distrito WHERE antigua = 'antigua';
DELETE FROM domains.posto WHERE antigua = 'antigua';
ALTER TABLE domains.provincia DROP COLUMN antigua;
ALTER TABLE domains.distrito DROP COLUMN antigua;
ALTER TABLE domains.posto DROP COLUMN antigua;
ALTER TABLE domains.provincia DROP COLUMN ara;
ALTER TABLE domains.distrito DROP COLUMN ara;
ALTER TABLE domains.posto DROP COLUMN ara;



--
-- inv_domains_loc_adm
--

ALTER TABLE inventario_dominios.provincia  ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE inventario_dominios.distrito  ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE inventario_dominios.posto  ADD COLUMN antigua text not null default 'nueva';
UPDATE inventario_dominios.provincia SET antigua = 'antigua';
UPDATE inventario_dominios.distrito SET antigua = 'antigua';
UPDATE inventario_dominios.posto SET antigua = 'antigua';
ALTER TABLE inventario_dominios.provincia  ADD COLUMN ara text;
ALTER TABLE inventario_dominios.distrito  ADD COLUMN ara text;
ALTER TABLE inventario_dominios.posto  ADD COLUMN ara text;



INSERT INTO inventario_dominios.provincia as a (key, ara)
    SELECT nome, ara FROM cbase.provincias
    ON CONFLICT ON CONSTRAINT provincia_key_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH
foo as (
    select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM inventario_dominios.provincia
)
, bar AS (
    select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent
)
update inventario_dominios.provincia p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');



INSERT INTO inventario_dominios.distrito as a (key, parent, ara)
    SELECT nome, loc_provin, ara FROM cbase.distritos
    ON CONFLICT ON CONSTRAINT distrito_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH foo as (select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM inventario_dominios.distrito), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update inventario_dominios.distrito p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');


INSERT INTO inventario_dominios.posto as a(key, parent, ara)
    SELECT nome, loc_distri, ara FROM cbase.postos
    ON CONFLICT ON CONSTRAINT posto_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH foo as (select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM inventario_dominios.posto), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update inventario_dominios.posto p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');


-- AJUSTES A MANO


DELETE FROM inventario_dominios.provincia WHERE antigua = 'antigua';
DELETE FROM inventario_dominios.distrito WHERE antigua = 'antigua';
DELETE FROM inventario_dominios.posto WHERE antigua = 'antigua';
ALTER TABLE inventario_dominios.provincia DROP COLUMN antigua;
ALTER TABLE inventario_dominios.distrito DROP COLUMN antigua;
ALTER TABLE inventario_dominios.posto DROP COLUMN antigua;
ALTER TABLE inventario_dominios.provincia DROP COLUMN ara;
ALTER TABLE inventario_dominios.distrito DROP COLUMN ara;
ALTER TABLE inventario_dominios.posto DROP COLUMN ara;


DELETE FROM inventario_dominios.provincia WHERE (SELECT key FROM domains.ara LIMIT 1) != ALL(app);
DELETE FROM inventario_dominios.distrito WHERE (SELECT key FROM domains.ara LIMIT 1) != ALL(app);
DELETE FROM inventario_dominios.posto WHERE (SELECT key FROM domains.ara LIMIT 1) != ALL(app);


--
-- ute_domains_loc_hidro
--

ALTER TABLE domains.divisao ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE domains.bacia ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE domains.subacia  ADD COLUMN antigua text not null default 'nueva';
UPDATE domains.divisao SET antigua = 'antigua';
UPDATE domains.bacia SET antigua = 'antigua';
UPDATE domains.subacia SET antigua = 'antigua';
ALTER TABLE domains.divisao ADD COLUMN ara text;
ALTER TABLE domains.bacia ADD COLUMN ara text;
ALTER TABLE domains.subacia  ADD COLUMN ara text;


INSERT INTO domains.divisao as a (key, ara, tooltip)
    SELECT siglas, string_agg(ara, '; ') as ara, string_agg(nome, '; ') as nome FROM cbase.divisao GROUP BY siglas
    ON CONFLICT ON CONSTRAINT divisao_key_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara, tooltip = EXCLUDED.tooltip
;


WITH foo as (select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM domains.divisao), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update domains.divisao p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');



INSERT INTO domains.bacia as a (key, parent, ara)
    SELECT nome, divisao, string_agg(DISTINCT ara, '; ') as ara FROM cbase.bacias GROUP BY nome, divisao
    ON CONFLICT ON CONSTRAINT bacia_key_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH foo as (select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM domains.bacia), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update domains.bacia p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');

WITH foo AS (
    SELECT
        trim(unnest(string_to_array(subacia, ','))) as misubacia
        , nome
        , string_agg(DISTINCT ara, '; ') miara
    FROM cbase.bacias
    GROUP BY misubacia, nome
)
INSERT INTO domains.subacia as a (key, parent, ara)
    SELECT misubacia, nome, miara FROM foo
    ON CONFLICT ON CONSTRAINT subacia_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH
foo as (
    select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM domains.subacia
)
, bar AS (
    select key, parent, array_agg(DISTINCT v) vv from foo WHERE length(v) > 0 GROUP BY key, parent
)
update domains.subacia p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');

-- AJUSTES A MANO

UPDATE utentes.exploracaos SET loc_bacia = 'Sem identificar' WHERE loc_bacia = 'Cuacua';
UPDATE utentes.exploracaos SET loc_bacia = 'Cuacua' WHERE loc_bacia = 'Lualua';

-- ahora namacurra, dgbz, aracentro-ip
-- antes namacurra, ugbo (dgblic), aracentro-norte (aranorte-ip)
INSERT INTO domains.bacia (key, parent, app, antigua) VALUES ('Namacurra', 'DGBLIC', '{Norte}', 'nueva');

WITH
a(old, old_ara, new, new_ara) AS (
    VALUES
    ('UGBO', 'ARA Centro-Norte', 'DGBLIC', 'ARA-Norte, IP')
    , ('UGBE', 'ARA Centro-Norte', 'DGBLIC', 'ARA-Norte, IP')
    , ('UGBL', 'ARA Centro-Norte', 'DGBL', 'ARA-Norte, IP')
    , ('UGBL', 'ARA Sul', 'DGBL', 'ARA-Sul, IP')
    , ('UGBS', 'ARA Sul', 'DGBS', 'ARA-Sul, IP')
    , ('UGBU', 'ARA Sul', 'DGBUM', 'ARA-Sul, IP')
    , ('UGBI', 'ARA Sul', 'DGBI', 'ARA-Sul, IP')
    , ('UGBC', 'ARA Norte', 'DGBM', 'ARA-Norte, IP')
    , ('UGBMM', 'ARA Norte', 'DGBM', 'ARA-Norte, IP')
    , ('UGBR', 'ARA Norte', 'DGBR', 'ARA-Norte, IP')
    , ('UGBP', 'ARA Centro', 'DGBP', 'ARA-Centro, IP')
    , ('UGBS', 'ARA Centro', 'DGBB', 'ARA-Centro, IP')
    , ('UGBB', 'ARA Centro', 'DGBB', 'ARA-Centro, IP')
    , ('UGBZ', 'ARA Zambeze', 'DGBZ', 'ARA-Centro, IP')
)
, update_documentos AS (
    UPDATE utentes.documentos d SET divisao = a.new FROM a WHERE a.old = d.divisao AND a.new_ara = (SELECT tooltip FROM domains.ara LIMIT 1)
)
, update_users AS (
    UPDATE utentes.users d SET divisao = a.new FROM a WHERE a.old = d.divisao AND a.new_ara = (SELECT tooltip FROM domains.ara LIMIT 1)
)
UPDATE utentes.exploracaos d SET loc_divisao = a.new FROM a WHERE a.old = d.loc_divisao AND a.new_ara = (SELECT tooltip FROM domains.ara LIMIT 1)
;



-- FIN AJUSTES A MANO


DELETE FROM domains.divisao WHERE antigua = 'antigua';
DELETE FROM domains.bacia WHERE antigua = 'antigua';
DELETE FROM domains.subacia WHERE antigua = 'antigua';
ALTER TABLE domains.divisao DROP COLUMN antigua;
ALTER TABLE domains.bacia DROP COLUMN antigua;
ALTER TABLE domains.subacia DROP COLUMN antigua;
ALTER TABLE domains.divisao DROP COLUMN ara;
ALTER TABLE domains.bacia DROP COLUMN ara;
ALTER TABLE domains.subacia DROP COLUMN ara;






--
-- inv_domains_loc_hidro
--

ALTER TABLE inventario_dominios.divisao ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE inventario_dominios.bacia ADD COLUMN antigua text not null default 'nueva';
ALTER TABLE inventario_dominios.subacia  ADD COLUMN antigua text not null default 'nueva';
UPDATE inventario_dominios.divisao SET antigua = 'antigua';
UPDATE inventario_dominios.bacia SET antigua = 'antigua';
UPDATE inventario_dominios.subacia SET antigua = 'antigua';
ALTER TABLE inventario_dominios.divisao ADD COLUMN ara text;
ALTER TABLE inventario_dominios.bacia ADD COLUMN ara text;
ALTER TABLE inventario_dominios.subacia  ADD COLUMN ara text;


INSERT INTO inventario_dominios.divisao as a (key, ara)
    SELECT siglas, string_agg(ara, '; ') as ara FROM cbase.divisoes GROUP BY siglas
    ON CONFLICT ON CONSTRAINT divisao_key_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;


WITH foo as (select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM inventario_dominios.divisao), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update inventario_dominios.divisao p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');



-- Sem identificar
WITH foo AS (
    -- ON CONFLICT only works if there is only 1 row conflicting, but for cases like
    -- (Sem identificar, DGBLIC), (Sem identificar, DGBP) both rows will conflict.
    SELECT nome, divisao, string_agg(DISTINCT ara, '; ') as ara
    FROM cbase.bacias
    WHERE
        ara ~ (SELECT tooltip FROM domains.ara LIMIT 1)
        -- WORKAROUND hasta que se añada loc_divisao a las tablas de inventario
        AND (
            -- ARAS
            nome NOT IN ('Bacias costeiras', 'Bacias endorreicas', 'Sem identificar')
            OR
            (nome = 'Bacias costeiras' AND divisao = 'DGBUM')
            OR
            (nome = 'Bacias endorreicas' AND divisao = 'DGBS')
            OR
            (nome = 'Sem identificar' AND divisao = 'DGBUM')

            -- ARAN
            OR
            (nome = 'Bacias costeiras' AND divisao = 'DGBM')
            OR
            (nome = 'Sem identificar' AND divisao = 'DGBM')
        )

    GROUP BY nome, divisao
)
INSERT INTO inventario_dominios.bacia as a (key, parent, ara)
    SELECT nome, divisao, ara FROM foo
    ON CONFLICT ON CONSTRAINT bacia_key_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara, parent = EXCLUDED.parent
;

WITH foo as (select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM inventario_dominios.bacia), bar AS ( select key, parent, array_agg(v) vv from foo WHERE length(v) > 0 GROUP BY key, parent)
update inventario_dominios.bacia p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');

WITH foo AS (
    SELECT
        trim(unnest(string_to_array(subacia, ','))) as misubacia
        , nome
        , string_agg(DISTINCT ara, '; ') miara
    FROM cbase.bacias
    GROUP BY misubacia, nome
)
INSERT INTO inventario_dominios.subacia as a (key, parent, ara)
    SELECT misubacia, nome, miara FROM foo
    ON CONFLICT ON CONSTRAINT subacia_key_parent_key
    DO UPDATE SET antigua = 'conflicto', ara = COALESCE(a.ara, '') || EXCLUDED.ara
;

WITH
foo as (
    select key, parent, utentes.extract_discriminator_from_ara_name_list(ara) v FROM inventario_dominios.subacia
)
, bar AS (
    select key, parent, array_agg(DISTINCT v) vv from foo WHERE length(v) > 0 GROUP BY key, parent
)
update inventario_dominios.subacia p set app = bar.vv from bar where COALESCE(p.key, '') = COALESCE(bar.key, '') and COALESCE(p.parent, '') = COALESCE(bar.parent, '');

-- AJUSTES A MANO

WITH
a(old, old_ara, new, new_ara) AS (
    VALUES
    ('UGBO', 'ARA Centro-Norte', 'DGBLIC', 'ARA-Norte, IP')
    , ('UGBE', 'ARA Centro-Norte', 'DGBLIC', 'ARA-Norte, IP')
    , ('UGBL', 'ARA Centro-Norte', 'DGBL', 'ARA-Norte, IP')
    , ('UGBL', 'ARA Sul', 'DGBL', 'ARA-Sul, IP')
    , ('UGBS', 'ARA Sul', 'DGBS', 'ARA-Sul, IP')
    , ('UGBU', 'ARA Sul', 'DGBUM', 'ARA-Sul, IP')
    , ('UGBI', 'ARA Sul', 'DGBI', 'ARA-Sul, IP')
    , ('UGBC', 'ARA Norte', 'DGBM', 'ARA-Norte, IP')
    , ('UGBMM', 'ARA Norte', 'DGBM', 'ARA-Norte, IP')
    , ('UGBR', 'ARA Norte', 'DGBR', 'ARA-Norte, IP')
    , ('UGBP', 'ARA Centro', 'DGBP', 'ARA-Centro, IP')
    , ('UGBS', 'ARA Centro', 'DGBB', 'ARA-Centro, IP')
    , ('UGBB', 'ARA Centro', 'DGBB', 'ARA-Centro, IP')
    , ('UGBZ', 'ARA Zambeze', 'DGBZ', 'ARA-Centro, IP')
)
UPDATE inventario.fontes d SET loc_divisao = a.new FROM a WHERE a.old = d.loc_divisao AND a.new_ara = (SELECT tooltip FROM domains.ara LIMIT 1)
;


-- FIN AJUSTES A MANO


DELETE FROM inventario_dominios.divisao WHERE antigua = 'antigua';
DELETE FROM inventario_dominios.bacia WHERE antigua = 'antigua';
DELETE FROM inventario_dominios.subacia WHERE antigua = 'antigua';
ALTER TABLE inventario_dominios.divisao DROP COLUMN antigua;
ALTER TABLE inventario_dominios.bacia DROP COLUMN antigua;
ALTER TABLE inventario_dominios.subacia DROP COLUMN antigua;
ALTER TABLE inventario_dominios.divisao DROP COLUMN ara;
ALTER TABLE inventario_dominios.bacia DROP COLUMN ara;
ALTER TABLE inventario_dominios.subacia DROP COLUMN ara;



DELETE FROM inventario_dominios.divisao WHERE (SELECT key FROM domains.ara LIMIT 1) != ALL(app);
DELETE FROM inventario_dominios.bacia WHERE (SELECT key FROM domains.ara LIMIT 1) != ALL(app);
DELETE FROM inventario_dominios.subacia WHERE (SELECT key FROM domains.ara LIMIT 1) != ALL(app);


REFRESH MATERIALIZED VIEW domains.domains;

DROP FUNCTION utentes.extract_discriminator_from_ara_name_list(text);

