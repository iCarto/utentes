/*
If the names of the divisoes changes, the codes used in facturacao, probably should be also changed
 */
WITH to_update AS (
    SELECT
        f.gid AS f_gid
        , e.gid e_gid
        , e.loc_divisao
        , f.fact_id
        , f.recibo_id
        ,
        LEFT (f.fact_id
            , 5) || e.loc_divisao ||
        RIGHT (f.fact_id
            , 5) AS new_fact_id
        ,
        LEFT (f.recibo_id
            , 5) || e.loc_divisao ||
        RIGHT (f.recibo_id
            , 5) AS new_recibo_id
    FROM
        utentes.exploracaos e
        JOIN utentes.facturacao f ON e.gid = f.exploracao)
UPDATE
    utentes.facturacao
SET
    fact_id = to_update.new_fact_id
    , recibo_id = to_update.new_recibo_id
FROM
    to_update
WHERE
    gid = to_update.f_gid;

