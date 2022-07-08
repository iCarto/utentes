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
    SELECT siglas, string_agg(ara, '; ') as ara, string_agg(nome, '; ') as nome FROM cbase.divisoes GROUP BY siglas
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

INSERT INTO domains.subacia as a (key, parent, ara)
    SELECT nome, bacia, string_agg(DISTINCT ara, '; ') as ara FROM cbase.subacias GROUP BY nome, bacia
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

INSERT INTO inventario_dominios.subacia as a (key, parent, ara)
    SELECT nome, bacia, string_agg(DISTINCT ara, '; ') as ara FROM cbase.subacias GROUP BY nome, bacia
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




--
-- Update inventario and utente data for new locations
--

/* REPLACE THIS: UPDATE DATA FOR NEW LOCATIONS */

UPDATE utentes.exploracaos SET loc_subaci = NULL WHERE loc_subaci IN ('Gorongozi', 'Incomati', 'Meluli', 'Molocue', 'Inharrime', 'Impaputo', 'Umbelúzi') AND the_geom IS NULL;
UPDATE inventario.fontes SET subacia = NULL WHERE subacia IN ('Incomati', 'Umbelúzi') AND geom IS NULL;
UPDATE inventario.barragens SET subacia = NULL WHERE subacia = 'Incomati' AND geom IS NULL;
UPDATE inventario.estacoes SET subacia = 'Nascente' WHERE subacia = 'Save' and cod_estac = 'E-420';


WITH subacias as (
    SELECT parent, (array_agg(key))[1] from domains.subacia group by parent having count(*) = 1 order by 1, 2
)
UPDATE utentes.exploracaos e SET
    loc_subaci = subacias.array_agg
FROM subacias
WHERE loc_bacia is not null and loc_subaci is null and e.loc_bacia = subacias.parent ;

WITH subacias as (
    SELECT parent, (array_agg(key))[1] from domains.subacia group by parent having count(*) = 1 order by 1, 2
)
UPDATE inventario.barragens e SET
    subacia = subacias.array_agg
FROM subacias
WHERE bacia is not null and subacia is null and e.bacia = subacias.parent ;

WITH subacias as (
    SELECT parent, (array_agg(key))[1] from domains.subacia group by parent having count(*) = 1 order by 1, 2
)
UPDATE inventario.estacoes e SET
    subacia = subacias.array_agg
FROM subacias
WHERE bacia is not null and subacia is null and e.bacia = subacias.parent ;

WITH subacias as (
    SELECT parent, (array_agg(key))[1] from domains.subacia group by parent having count(*) = 1 order by 1, 2
)
UPDATE inventario.fontes e SET
    subacia = subacias.array_agg
FROM subacias
WHERE bacia is not null and subacia is null and e.bacia = subacias.parent ;

--
-- clean up ute_domains_loc_hydro
--

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
-- clean up inv_domains_loc_hydro
--

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

