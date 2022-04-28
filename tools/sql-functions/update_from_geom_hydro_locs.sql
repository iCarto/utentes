/*
Script create_tmp_tables_geom_doesnt_match_adm_local must be called previously
in the same session
 */
-- hidro exploracaos
UPDATE
    utentes.exploracaos c
SET
    loc_divisao = cbase_divisao
    , loc_bacia = cbase_bacia
    , loc_subaci = cbase_subacia
FROM
    tmp_exploracaos_geom_doesnt_match_hydro_loc AS foo
WHERE
    c.gid = foo.gid;

-- hidro barragens
UPDATE
    inventario.barragens c
SET
    bacia = cbase_bacia
    , subacia = cbase_subacia
FROM
    tmp_barragens_geom_doesnt_match_hydro_loc AS foo
WHERE
    c.gid = foo.gid;

-- hidro estacoes
UPDATE
    inventario.estacoes c
SET
    bacia = cbase_bacia
    , subacia = cbase_subacia
FROM
    tmp_estacoes_geom_doesnt_match_hydro_loc AS foo
WHERE
    c.gid = foo.gid;

-- hidro fuentes
UPDATE
    inventario.fontes c
SET
    loc_divisao = cbase_divisao
    , bacia = cbase_bacia
    , subacia = cbase_subacia
FROM
    tmp_fontes_geom_doesnt_match_hydro_loc AS foo
WHERE
    c.gid = foo.gid;

