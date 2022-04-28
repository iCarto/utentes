/*
element geom is only compared with cbase.subacias geom. It's assumend that the relation
between cbase.subacias, cbase.bacias and cbase.divisoes is correct.
 */
-- hydro exploracaos
CREATE TEMPORARY TABLE tmp_exploracaos_geom_doesnt_match_hydro_loc AS
SELECT
    exp_id AS code
    , a.gid
    , (
        SELECT
            tooltip
        FROM
            domains.ara
        WHERE
            value = a.ara) AS ara
    , a.loc_divisao AS divisao
    , a.loc_bacia AS bacia
    , a.loc_subaci AS subacia
    , b.ara AS cbase_ara
    , b.divisao AS cbase_divisao
    , b.bacia AS cbase_bacia
    , b.nome AS cbase_subacia
FROM
    utentes.exploracaos a
    JOIN cbase.subacias b ON ST_Intersects (a.the_geom , b.geom)
WHERE
    a.ara != b.ara
    OR a.loc_divisao != b.divisao
    OR a.loc_bacia != b.bacia
    OR a.loc_subaci != b.nome
    OR (a.loc_bacia IS NOT NULL
        AND a.loc_subaci IS NULL)
ORDER BY
    cbase_ara
    , cbase_divisao
    , cbase_bacia
    , cbase_subacia
    , code;

-- hydro barragens
CREATE TEMPORARY TABLE tmp_barragens_geom_doesnt_match_hydro_loc AS
SELECT
    cod_barra AS code
    , a.gid
    , domain_ara.tooltip AS ara
    -- , a.loc_divisao AS divisao
    , NULL AS divisao
    , a.bacia AS bacia
    , a.subacia AS subacia
    , b.ara AS cbase_ara
    , b.divisao AS cbase_divisao
    , b.bacia AS cbase_bacia
    , b.nome AS cbase_subacia
FROM
    inventario.barragens a
    JOIN cbase.subacias b ON ST_Intersects (a.geom , b.geom)
    , LATERAL (
        SELECT
            tooltip
        FROM
            domains.ara
        LIMIT 1) AS domain_ara
WHERE
    domain_ara.tooltip != b.ara
    -- OR a.loc_divisao != b.divisao
    OR a.bacia != b.bacia
    OR a.subacia != b.nome
    OR (a.bacia IS NOT NULL
        AND a.subacia IS NULL)
ORDER BY
    cbase_ara
    , cbase_divisao
    , cbase_bacia
    , cbase_subacia
    , code;

-- hydro estacoes
CREATE TEMPORARY TABLE tmp_estacoes_geom_doesnt_match_hydro_loc AS
SELECT
    cod_estac AS code
    , a.gid
    , domain_ara.tooltip AS ara
    -- , a.loc_divisao AS divisao
    , NULL AS divisao
    , a.bacia AS bacia
    , a.subacia AS subacia
    , b.ara AS cbase_ara
    , b.divisao AS cbase_divisao
    , b.bacia AS cbase_bacia
    , b.nome AS cbase_subacia
FROM
    inventario.estacoes a
    JOIN cbase.subacias b ON ST_Intersects (a.geom , b.geom)
    , LATERAL (
        SELECT
            tooltip
        FROM
            domains.ara
        LIMIT 1) AS domain_ara
WHERE
    domain_ara.tooltip != b.ara
    -- OR a.loc_divisao != b.divisao
    OR a.bacia != b.bacia
    OR a.subacia != b.nome
    OR (a.bacia IS NOT NULL
        AND a.subacia IS NULL)
ORDER BY
    cbase_ara
    , cbase_divisao
    , cbase_bacia
    , cbase_subacia
    , code;

-- hydro fontes
CREATE TEMPORARY TABLE tmp_fontes_geom_doesnt_match_hydro_loc AS
SELECT
    cadastro AS code
    , a.gid
    , domain_ara.tooltip AS ara
    , a.loc_divisao AS divisao
    -- , NULL AS divisao
    , a.bacia AS bacia
    , a.subacia AS subacia
    , b.ara AS cbase_ara
    , b.divisao AS cbase_divisao
    , b.bacia AS cbase_bacia
    , b.nome AS cbase_subacia
FROM
    inventario.fontes a
    JOIN cbase.subacias b ON ST_Intersects (a.geom , b.geom)
    , LATERAL (
        SELECT
            tooltip
        FROM
            domains.ara
        LIMIT 1) AS domain_ara
WHERE
    domain_ara.tooltip != b.ara
    OR a.loc_divisao != b.divisao
    OR a.bacia != b.bacia
    OR a.subacia != b.nome
    OR (a.bacia IS NOT NULL
        AND a.subacia IS NULL)
ORDER BY
    cbase_ara
    , cbase_divisao
    , cbase_bacia
    , cbase_subacia
    , code;

CREATE TEMPORARY VIEW tmp_geom_doesnt_match_hydro_loc AS
SELECT
    *
    , 'exploracaos' AS tipo
FROM
    tmp_exploracaos_geom_doesnt_match_hydro_loc
UNION
SELECT
    *
    , 'barragens' AS tipo
FROM
    tmp_barragens_geom_doesnt_match_hydro_loc
UNION
SELECT
    *
    , 'estacoes' AS tipo
FROM
    tmp_estacoes_geom_doesnt_match_hydro_loc
UNION
SELECT
    *
    , 'fontes' AS tipo
FROM
    tmp_fontes_geom_doesnt_match_hydro_loc
ORDER BY
    cbase_ara
    , cbase_divisao
    , cbase_bacia
    , cbase_subacia
    , tipo
    , code;

