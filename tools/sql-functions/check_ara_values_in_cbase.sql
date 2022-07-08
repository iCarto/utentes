-- TODO. Refactor this to avoid hardcode each table. If there is change in the names, or a table added or removed
-- this will be difficult to check

WITH
foo AS (
    SELECT 'cbase.albufeiras', trim(unnest(string_to_array(ara, ';'))) as a from cbase.albufeiras
    UNION
    SELECT 'cbase.aras', trim(unnest(string_to_array(nome, ';'))) as a from cbase.aras
    UNION
    SELECT 'cbase.bacias', trim(unnest(string_to_array(ara, ';'))) as a from cbase.bacias
    UNION
    SELECT 'cbase.bacias_representacion', trim(unnest(string_to_array(ara, ';'))) as a from cbase.bacias_representacion
    UNION
    SELECT 'cbase.batimetria', trim(unnest(string_to_array(ara, ';'))) as a from cbase.batimetria
    UNION
    SELECT 'cbase.distritos', trim(unnest(string_to_array(ara, ';'))) as a from cbase.distritos
    UNION
    SELECT 'cbase.entidades_populacao', trim(unnest(string_to_array(ara, ';'))) as a from cbase.entidades_populacao
    UNION
    SELECT 'cbase.estradas', trim(unnest(string_to_array(ara, ';'))) as a from cbase.estradas
    UNION
    SELECT 'cbase.lagos', trim(unnest(string_to_array(ara, ';'))) as a from cbase.lagos
    UNION
    SELECT 'cbase.oceanos', trim(unnest(string_to_array(ara, ';'))) as a from cbase.oceanos
    UNION
    SELECT 'cbase.paises_limitrofes', trim(unnest(string_to_array(ara, ';'))) as a from cbase.paises_limitrofes
    UNION
    SELECT 'cbase.postos', trim(unnest(string_to_array(ara, ';'))) as a from cbase.postos
    UNION
    SELECT 'cbase.provincias', trim(unnest(string_to_array(ara, ';'))) as a from cbase.provincias
    UNION
    SELECT 'cbase.rios', trim(unnest(string_to_array(ara, ';'))) as a from cbase.rios
    UNION
    SELECT 'cbase.divisoes', trim(unnest(string_to_array(ara, ';'))) as a from cbase.divisoes
    UNION
    SELECT 'cbase.unidades_weap', trim(unnest(string_to_array(ara, ';'))) as a from cbase.unidades_weap
)
SELECT * FROM foo WHERE a IS NULL OR a NOT IN ('ARA-Norte, IP', 'ARA-Centro, IP', 'ARA-Sul, IP')
;
