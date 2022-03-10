/*
element geom is only compared with cbase.postos geom. It's assumend that the relation
between cbase.postos, cbase.distritos and cbase.provincias is correct.
 */
-- adm exploracaos
CREATE TEMPORARY TABLE tmp_exploracaos_geom_doesnt_match_adm_loc AS
SELECT
    exp_id AS code
    , a.gid
    , a.loc_provin AS provincia
    , a.loc_distri AS distrito
    , a.loc_posto AS posto
    , b.loc_provin cbase_provincia
    , b.loc_distri cbase_distrito
    , b.nome cbase_posto
FROM
    utentes.exploracaos a
    JOIN cbase.postos b ON ST_Intersects (a.the_geom , b.geom)
WHERE
    a.loc_provin != b.loc_provin
    OR a.loc_distri != b.loc_distri
    OR a.loc_posto != b.nome
ORDER BY
    provincia
    , distrito
    , posto
    , code;

-- adm barragens
CREATE TEMPORARY TABLE tmp_barragens_geom_doesnt_match_adm_loc AS
SELECT
    cod_barra AS code
    , a.gid
    , a.provincia
    , a.distrito
    , a.posto_adm AS posto
    , b.loc_provin cbase_provincia
    , b.loc_distri cbase_distrito
    , b.nome cbase_posto
FROM
    inventario.barragens a
    JOIN cbase.postos b ON ST_Intersects (a.geom , b.geom)
WHERE
    a.provincia != b.loc_provin
    OR a.distrito != b.loc_distri
    OR a.posto_adm != b.nome
ORDER BY
    provincia
    , distrito
    , posto
    , code;

-- adm estacoes
CREATE TEMPORARY TABLE tmp_estacoes_geom_doesnt_match_adm_loc AS
SELECT
    cod_estac AS code
    , a.gid
    , a.provincia
    , a.distrito
    , a.posto_adm AS posto
    , b.loc_provin cbase_provincia
    , b.loc_distri cbase_distrito
    , b.nome cbase_posto
FROM
    inventario.estacoes a
    JOIN cbase.postos b ON ST_Intersects (a.geom , b.geom)
WHERE
    a.provincia != b.loc_provin
    OR a.distrito != b.loc_distri
    OR a.posto_adm != b.nome
ORDER BY
    provincia
    , distrito
    , posto
    , code;

-- adm fontes
CREATE TEMPORARY TABLE tmp_fontes_geom_doesnt_match_adm_loc AS
SELECT
    cadastro AS code
    , a.gid
    , a.provincia
    , a.distrito
    , a.posto_adm AS posto
    , b.loc_provin cbase_provincia
    , b.loc_distri cbase_distrito
    , b.nome cbase_posto
FROM
    inventario.fontes a
    JOIN cbase.postos b ON ST_Intersects (a.geom , b.geom)
WHERE
    a.provincia != b.loc_provin
    OR a.distrito != b.loc_distri
    OR a.posto_adm != b.nome
ORDER BY
    provincia
    , distrito
    , posto
    , code;

CREATE TEMPORARY VIEW tmp_geom_doesnt_match_adm_loc AS
SELECT
    *
    , 'exploracaos' AS tipo
FROM
    tmp_exploracaos_geom_doesnt_match_adm_loc
UNION
SELECT
    *
    , 'barragens' AS tipo
FROM
    tmp_barragens_geom_doesnt_match_adm_loc
UNION
SELECT
    *
    , 'estacoes' AS tipo
FROM
    tmp_estacoes_geom_doesnt_match_adm_loc
UNION
SELECT
    *
    , 'fontes' AS tipo
FROM
    tmp_fontes_geom_doesnt_match_adm_loc
ORDER BY
    provincia
    , distrito
    , posto
    , tipo
    , code;

