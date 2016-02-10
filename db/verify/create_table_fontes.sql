-- Verify create_table_fontes

BEGIN;

SELECT gid, exploracao, tipo_agua, tipo_fonte, lat_lon, d_dado, c_requerid, c_max, c_real, contador, metodo_est
FROM utentes.fontes
WHERE FALSE;

ROLLBACK;
