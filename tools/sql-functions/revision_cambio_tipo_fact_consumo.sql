WITH data AS (
    SELECT
        e.exp_id
        , e.exp_name
        , f.ano
        , f.mes
        , f.periodo_fact
        , f.fact_tipo AS fact_fact_tipo
        , e.fact_tipo AS exp_fact_tipo
        , f.consumo_tipo_sup AS fact_consumo_tipo_sup
        , sup.consumo_tipo AS lic_consumo_tipo_sup
        , f.consumo_tipo_sub AS fact_consumo_tipo_sub
        , sub.consumo_tipo AS lic_consumo_tipo_sub
    FROM
        utentes.facturacao f
        JOIN utentes.exploracaos e ON f.exploracao = e.gid
        LEFT JOIN (
            SELECT
                licencias.lic_nro
                , licencias.tipo_agua
                , licencias.estado
                , licencias.consumo_tipo
                , licencias.exploracao
            FROM
                utentes.licencias
            WHERE
                licencias.tipo_agua = 'Subterrânea'::text) sub ON e.gid = sub.exploracao
        LEFT JOIN (
            SELECT
                licencias.lic_nro
                , licencias.tipo_agua
                , licencias.estado
                , licencias.consumo_tipo
                , licencias.exploracao
            FROM
                utentes.licencias
            WHERE
                licencias.tipo_agua = 'Superficial'::text) sup ON e.gid = sup.exploracao
        ORDER BY
            e.exp_id
            , ano
            , mes
)
, data_filtered AS (
    SELECT
        *
    FROM
        data
    WHERE
        fact_fact_tipo != exp_fact_tipo
)
, fact_tipo_changes AS (
    SELECT
        exp_id
        , exp_name
        , ano
        , mes
        , periodo_fact
        , fact_fact_tipo AS old_fact_tipo
        , exp_fact_tipo AS new_fact_tipo
        , NULL AS new_consumo_tipo_sup
        , NULL AS old_consumo_tipo_sup
        , NULL AS new_consumo_tipo_sub
        , NULL AS old_consumo_tipo_sub
    FROM (
        SELECT
            *
            , row_number() OVER (PARTITION BY exp_id ORDER BY exp_id
                , ano DESC
                , mes DESC)
        FROM data
    WHERE fact_fact_tipo != exp_fact_tipo) foo
WHERE row_number = 1
)
, consumo_tipo_changes AS (
    SELECT
        exp_id
        , exp_name
        , ano
        , mes
        , periodo_fact
        , NULL AS old_fact_tipo
        , NULL AS new_fact_tipo
        , fact_consumo_tipo_sup AS new_consumo_tipo_sup
        , lag_sup AS old_consumo_tipo_sup
        , fact_consumo_tipo_sub AS new_consumo_tipo_sub
        , lag_sub AS old_consumo_tipo_sub
    FROM (
        SELECT
            *
            , LAG(fact_consumo_tipo_sub
                , 1) OVER (PARTITION BY exp_id ORDER BY exp_id
                , ano ASC
                , mes ASC) AS lag_sub
        , LAG(fact_consumo_tipo_sup
            , 1) OVER (PARTITION BY exp_id ORDER BY exp_id
            , ano ASC
            , mes ASC) AS lag_sup
    FROM
        data) bar
    WHERE
        fact_consumo_tipo_sup != lag_sup
        OR fact_consumo_tipo_sub != lag_sub
)
SELECT
    *
FROM
    fact_tipo_changes
UNION
SELECT
    *
FROM
    consumo_tipo_changes
ORDER BY
    exp_id
    , ano
    , mes;

WITH data AS (
    SELECT
        e.exp_id
        , e.exp_name
        , f.ano
        , f.mes
        , f.periodo_fact
        , f.fact_tipo AS fact_fact_tipo
        , e.fact_tipo AS exp_fact_tipo
        , f.consumo_tipo_sup AS fact_consumo_tipo_sup
        , sup.consumo_tipo AS lic_consumo_tipo_sup
        , f.consumo_tipo_sub AS fact_consumo_tipo_sub
        , sub.consumo_tipo AS lic_consumo_tipo_sub
    FROM
        utentes.facturacao f
        JOIN utentes.exploracaos e ON f.exploracao = e.gid
        LEFT JOIN (
            SELECT
                licencias.lic_nro
                , licencias.tipo_agua
                , licencias.estado
                , licencias.consumo_tipo
                , licencias.exploracao
            FROM
                utentes.licencias
            WHERE
                licencias.tipo_agua = 'Subterrânea'::text) sub ON e.gid = sub.exploracao
        LEFT JOIN (
            SELECT
                licencias.lic_nro
                , licencias.tipo_agua
                , licencias.estado
                , licencias.consumo_tipo
                , licencias.exploracao
            FROM
                utentes.licencias
            WHERE
                licencias.tipo_agua = 'Superficial'::text) sup ON e.gid = sup.exploracao
        ORDER BY
            e.exp_id
            , ano
            , mes
)
, data_filtered AS (
    SELECT
        *
    FROM
        data
    WHERE
        fact_fact_tipo != exp_fact_tipo
)
, fact_tipo_changes AS (
    SELECT
        exp_id
        , exp_name
        , TO_CHAR(lower(periodo_fact)
            , 'MM/YYYY') AS fact_repr
        , ano
        , mes
        , periodo_fact
        , fact_fact_tipo AS old_fact_tipo
        , exp_fact_tipo AS new_fact_tipo
        , NULL AS new_consumo_tipo_sup
        , NULL AS old_consumo_tipo_sup
        , NULL AS new_consumo_tipo_sub
        , NULL AS old_consumo_tipo_sub
    FROM (
        SELECT
            *
            , row_number() OVER (PARTITION BY exp_id ORDER BY exp_id
                , ano DESC
                , mes DESC)
        FROM data
    WHERE fact_fact_tipo != exp_fact_tipo) foo
WHERE row_number = 1
)
, consumo_tipo_changes AS (
    SELECT
        exp_id
        , exp_name
        , TO_CHAR(lower(periodo_fact)
            , 'MM/YYYY') AS fact_repr
    , ano
    , mes
    , periodo_fact
    , NULL AS old_fact_tipo
    , NULL AS new_fact_tipo
    , fact_consumo_tipo_sup AS new_consumo_tipo_sup
    , lag_sup AS old_consumo_tipo_sup
    , fact_consumo_tipo_sub AS new_consumo_tipo_sub
    , lag_sub AS old_consumo_tipo_sub
FROM (
    SELECT
        *
        , LAG(fact_consumo_tipo_sub
            , 1) OVER (PARTITION BY exp_id ORDER BY exp_id
            , ano ASC
            , mes ASC) AS lag_sub
    , LAG(fact_consumo_tipo_sup
        , 1) OVER (PARTITION BY exp_id ORDER BY exp_id
        , ano ASC
        , mes ASC) AS lag_sup
FROM
    data) bar
WHERE
    fact_consumo_tipo_sup != lag_sup
    OR fact_consumo_tipo_sub != lag_sub
)
SELECT
    *
FROM
    fact_tipo_changes
UNION
SELECT
    *
FROM
    consumo_tipo_changes
ORDER BY
    exp_id
    , ano
    , mes;

