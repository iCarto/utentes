-- Verify create_table_fontes

BEGIN;

SELECT gid, tipo_agua, tipo_fonte, lat_lon, d_dado, c_soli, c_max, c_real, contador, metodo_est, observacio, exploracao
FROM utentes.fontes
WHERE FALSE;

ROLLBACK;
