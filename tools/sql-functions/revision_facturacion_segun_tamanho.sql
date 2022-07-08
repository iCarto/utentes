/*

Comprueba que el Tipo de Consumo y el Tipo de Facturación sean acordes a la
clasificación por tamaño

Sólo se tienen en cuenta las explotaciones facturables (Licenciada, Utente de facto),
con consumo licenciado no nulo
 */
WITH exps AS (
    SELECT
        e.gid AS exploracao_id
        , e.exp_id
        , e.fact_tipo AS e_fact_tipo
        , array_agg(l.consumo_tipo) AS e_consumo_tipo
        , SUM(l.c_licencia) AS e_consumo_licenciado
        , SUM(consumo_fact) AS e_consumo_facturado
        , SUM(l.c_licencia) - SUM(consumo_fact) AS licenciado_vs_facturado
        , CASE WHEN SUM(l.c_licencia) = 0 THEN
            COALESCE(SUM(consumo_fact)
                , SUM(l.c_licencia)
                , 0)
        WHEN SUM(l.c_licencia) IS NULL THEN
            COALESCE(SUM(consumo_fact)
                , SUM(l.c_licencia)
                , NULL)
        ELSE
            SUM(l.c_licencia)
        END AS e_consumo_para_categorizar
    FROM
        utentes.exploracaos e
        JOIN utentes.licencias l ON e.gid = l.exploracao
    WHERE
        estado IN ('Licenciada'
            , 'Utente de facto')
    GROUP BY
        e.gid
        , e.exp_id
        , e.fact_tipo
    ORDER BY
        e.exp_id
)
, categorized AS (
    SELECT
        *
    FROM
        exps
        JOIN domains.size_category s ON s.consumo_range @> e_consumo_para_categorizar
    ORDER BY
        e_consumo_para_categorizar
        , exp_id
)
SELECT
    *
FROM
    categorized
WHERE
    e_fact_tipo != fact_tipo
    OR NOT (consumo_tipo = ANY (e_consumo_tipo));

