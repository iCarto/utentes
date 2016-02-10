-- Verify create_table_exploracaos

BEGIN;

SELECT gid, exp_name, exp_id, observacio, loc_provin, loc_distri, loc_posto, loc_nucleo, loc_endere, loc_bacia, loc_rio, pagos, c_requerid, c_licencia, c_real, c_estimado, the_geom
FROM utentes.exploracaos
WHERE FALSE;

ROLLBACK;
