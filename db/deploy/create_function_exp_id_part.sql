-- Deploy utentes:create_function_exp_id_part to pg

BEGIN;

CREATE OR REPLACE FUNCTION utentes.exp_id_part (
    IN exp_id TEXT
    , OUT serie TEXT
    , OUT ara TEXT
    , OUT year TEXT
    , OUT state TEXT
)
AS $BODY$
BEGIN
    SELECT
        LEFT(exp_id, 3)
        , SPLIT_PART(exp_id, '/', 2)
        -- substring(exp_id, 10, 4) AS year codificación antigua
        , substring(exp_id FROM '\d{3}/.*/(\d{4})') AS year
        , RIGHT(exp_id, 2)
    INTO serie, ara, year, state;
END
$BODY$ LANGUAGE plpgsql;

-- this will return all columns
-- select * from exp_id_part('238/ARAS-IP/2021/CL');

-- these will return one column
-- select year exp_id_part('238/ARAS-IP/2021/CL');
-- select (exp_id_part(exp_id)).year;

-- select exp_id, exp_id_part(exp_id) from utentes.exploracaos;


COMMIT;
