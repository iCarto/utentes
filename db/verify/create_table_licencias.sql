-- Verify create_table_licencias

BEGIN;

SELECT gid, lic_nro, lic_tipo, cadastro, estado, d_emissao, d_validade, c_soli_tot, c_soli_int, c_soli_fon, c_licencia, c_real_tot, c_real_int, c_real_fon, exploracao
FROM utentes.licencias
WHERE FALSE;

ROLLBACK;
