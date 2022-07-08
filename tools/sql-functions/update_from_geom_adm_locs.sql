/*
Script create_tmp_tables_geom_doesnt_match_adm_local must be called previously
in the same session
 */
-- adm exploracaos
UPDATE
    utentes.exploracaos c
SET
    loc_provin = cbase_provincia
    , loc_distri = cbase_distrito
    , loc_posto = cbase_posto
FROM
    tmp_exploracaos_geom_doesnt_match_adm_loc AS foo
WHERE
    c.gid = foo.gid;

-- adm barragens
UPDATE
    inventario.barragens c
SET
    provincia = cbase_provincia
    , distrito = cbase_distrito
    , posto_adm = cbase_posto
FROM
    tmp_barragens_geom_doesnt_match_adm_loc AS foo
WHERE
    c.gid = foo.gid;

-- adm estacoes
UPDATE
    inventario.estacoes c
SET
    provincia = cbase_provincia
    , distrito = cbase_distrito
    , posto_adm = cbase_posto
FROM
    tmp_estacoes_geom_doesnt_match_adm_loc AS foo
WHERE
    c.gid = foo.gid;

-- adm fontes
UPDATE
    inventario.fontes c
SET
    provincia = cbase_provincia
    , distrito = cbase_distrito
    , posto_adm = cbase_posto
FROM
    tmp_fontes_geom_doesnt_match_adm_loc AS foo
WHERE
    c.gid = foo.gid;

