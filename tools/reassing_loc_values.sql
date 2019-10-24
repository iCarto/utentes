-- adm barragens
with foo as (
    SELECT
        cod_barra
        , a.gid, a.provincia, a.distrito, a.posto_adm, b.loc_provin cbase_provincia, b.loc_distri cbase_distrito, b.nome cbase_posto FROM inventario.barragens a JOIN cbase.postos b ON ST_Intersects(a.geom, b.geom) WHERE a.provincia != b.loc_provin OR a.distrito != b.loc_distri OR a.posto_adm != b.nome
)
update inventario.barragens c set provincia = cbase_provincia, distrito = cbase_distrito, posto_adm = cbase_posto FROM foo WHERE c.gid = foo.gid
;

-- adm estacoes
with foo as (
    SELECT
        cod_estac
        , a.gid, a.provincia, a.distrito, a.posto_adm, b.loc_provin cbase_provincia, b.loc_distri cbase_distrito, b.nome cbase_posto FROM inventario.estacoes a JOIN cbase.postos b ON ST_Intersects(a.geom, b.geom) WHERE a.provincia != b.loc_provin OR a.distrito != b.loc_distri OR a.posto_adm != b.nome
)
update inventario.estacoes c set provincia = cbase_provincia, distrito = cbase_distrito, posto_adm = cbase_posto FROM foo WHERE c.gid = foo.gid
;

-- adm fuentes
with foo as (
    SELECT
        cadastro
        , a.gid, a.provincia, a.distrito, a.posto_adm, b.loc_provin cbase_provincia, b.loc_distri cbase_distrito, b.nome cbase_posto FROM inventario.fontes a JOIN cbase.postos b ON ST_Intersects(a.geom, b.geom) WHERE a.provincia != b.loc_provin OR a.distrito != b.loc_distri OR a.posto_adm != b.nome
)
update inventario.fontes c set provincia = cbase_provincia, distrito = cbase_distrito, posto_adm = cbase_posto FROM foo WHERE c.gid = foo.gid
;

-- adm inventario exploracaos
with foo as (
    SELECT
        exp_id
        , a.gid, a.loc_provin, a.loc_distri, a.loc_post, b.loc_provin cbase_provincia, b.loc_distri cbase_distrito, b.nome cbase_posto FROM inventario.exploracoes a JOIN cbase.postos b ON ST_Intersects(a.geom, b.geom) WHERE a.loc_provin != b.loc_provin OR a.loc_distri != b.loc_distri OR a.loc_post != b.nome
)
update inventario.exploracoes c set loc_provin = cbase_provincia, loc_distri = cbase_distrito, loc_post = cbase_posto FROM foo WHERE c.gid = foo.gid
;


-- hidro barragens
with foo as (
    SELECT
        cod_barra
        , a.gid, a.bacia, a.subacia, b.nome cbase_bacia, b.subacia cbase_subacia, b.ara FROM inventario.barragens a JOIN cbase.bacias b ON ST_Intersects(a.geom, b.geom) WHERE a.bacia != b.nome OR a.subacia != b.subacia
)
update inventario.barragens c set bacia = b.nome, subacia = b.subacia FROM foo WHERE c.gid = foo.gid
;

-- hidro estacoes
with foo as (
    SELECT
        cod_estac
        , a.gid, a.bacia, a.subacia, b.nome cbase_bacia, b.subacia cbase_subacia, b.ara FROM inventario.estacoes a JOIN cbase.bacias b ON ST_Intersects(a.geom, b.geom) WHERE a.bacia != b.nome OR a.subacia != b.subacia
)
update inventario.estacoes c set bacia = b.nome, subacia = b.subacia FROM foo WHERE c.gid = foo.gid
;

-- hidro fuentes
with foo as (
    SELECT
        cadastro
        , a.gid, a.bacia, a.subacia, b.nome cbase_bacia, b.subacia cbase_subacia, b.ara FROM inventario.fontes a JOIN cbase.bacias b ON ST_Intersects(a.geom, b.geom) WHERE a.bacia != b.nome OR a.subacia != b.subacia
)
update inventario.fontes c set bacia = b.nome, subacia = b.subacia FROM foo WHERE c.gid = foo.gid
;

-- hidro inventario exploracaos
with foo as (
    SELECT
        exp_id
        , a.gid, a.loc_bacia, a.loc_subaci, b.nome cbase_bacia, b.subacia cbase_subacia, b.ara FROM inventario.exploracoes a JOIN cbase.bacias b ON ST_Intersects(a.geom, b.geom) WHERE a.loc_bacia != b.nome OR a.loc_subaci != b.subacia
)
update inventario.exploracoes c set loc_bacia = b.nome, loc_subaci = b.subacia FROM foo WHERE c.gid = foo.gid
;

-- amd utentes inventario
with foo as (
    SELECT
        exp_id
        , a.gid, a.loc_provin, a.loc_distri, a.loc_posto, b.loc_provin cbase_provincia, b.loc_distri cbase_distrito, b.nome cbase_posto
    FROM utentes.exploracaos a JOIN cbase.postos b ON ST_Intersects(a.the_geom, b.geom)
    WHERE a.loc_provin != b.loc_provin OR a.loc_distri != b.loc_distri OR a.loc_posto != b.nome
)
update utentes.exploracaos c set loc_provin = cbase_provincia, loc_distri = cbase_distrito, loc_posto = cbase_posto FROM foo WHERE c.gid = foo.gid
;

-- hidro utentes exploracaos
with foo as (
    SELECT
        exp_id
        , a.gid, a.loc_unidad, a.loc_bacia, a.loc_subaci, d.parent as cbase_unidade, b.nome cbase_bacia, b.subacia cbase_subacia, b.ara
    FROM
        utentes.exploracaos a
        JOIN cbase.bacias b ON ST_Intersects(a.the_geom, b.geom)
        left join (SELECT key, parent FROM domains.bacia g WHERE (SELECT h.key FROM domains.ara h LIMIT 1) = ANY(g.app)) d on b.nome = d.key
    WHERE a.loc_bacia != b.nome OR a.loc_subaci != b.subacia
)
update utentes.exploracaos c set loc_bacia = b.nome, loc_subaci = b.subacia FROM foo WHERE c.gid = foo.gid
;
