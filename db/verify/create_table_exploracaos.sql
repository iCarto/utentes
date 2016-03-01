-- Verify create_table_exploracaos

BEGIN;

SELECT gid, exp_id, exp_name, d_soli, observacio, loc_provin, loc_distri, loc_posto, loc_nucleo, loc_endere, loc_bacia, loc_subaci, loc_rio, pagos, c_soli, c_licencia, c_real, c_estimado, actividade, area, the_geom
FROM utentes.exploracaos
WHERE FALSE;

ROLLBACK;
