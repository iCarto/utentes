-- Verify utentes:adds_duat_fields_to_exploracao on pg

BEGIN;

SELECT
    d_titulo
    , d_proceso
    , d_folha
    , d_parcela
    , d_area
    , d_d_emis
    , d_l_emis
FROM utentes.exploracaos
WHERE false
;


ROLLBACK;
