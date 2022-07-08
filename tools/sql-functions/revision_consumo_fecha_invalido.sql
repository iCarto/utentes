WITH data AS (
    SELECT
        e.exp_id
        , e.exp_name
        , l.tipo_agua
        , l.estado
        , l.c_licencia
        , l.d_emissao
        , l.d_validade
    FROM
        utentes.licencias l
        JOIN utentes.exploracaos e ON e.gid = l.exploracao
)
SELECT
    *
FROM
    data
WHERE ((c_licencia IS NULL
        OR d_emissao IS NULL
        OR d_validade IS NULL)
    AND estado IN ('Licenciada'))
    OR d_emissao > now()
ORDER BY
    RIGHT (exp_id
        , 7)
    , 1
    , tipo_agua;

