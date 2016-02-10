-- Verify create_table_licencias

BEGIN;

SELECT gid, lic_nro, lic_tipo, exploracao, cadastro, d_emissao, d_validade, d_solici, estado, c_requerid, c_licencia, c_real, c_real_int
FROM utentes.licencias
WHERE FALSE;

ROLLBACK;
