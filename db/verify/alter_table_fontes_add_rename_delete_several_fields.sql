-- Verify utentes:alter_table_fontes_add_rename_delete_several_fields on pg

BEGIN;

SELECT cadastro_a FROM inventario.fontes WHERE FALSE;
SELECT lat_lon FROM inventario.fontes WHERE FALSE;
SELECT metodo_est FROM inventario.fontes WHERE FALSE;
SELECT c_max FROM inventario.fontes WHERE FALSE;
SELECT c_soli FROM inventario.fontes WHERE FALSE;
SELECT c_real FROM inventario.fontes WHERE FALSE;
SELECT exp_id FROM inventario.fontes WHERE FALSE;
SELECT lic_nro FROM inventario.fontes WHERE FALSE;
SELECT n_licen_a FROM inventario.fontes WHERE FALSE;
SELECT abastecim FROM inventario.fontes WHERE FALSE;

SELECT tipo_agua FROM inventario.fontes WHERE FALSE;
SELECT loc_unidad FROM inventario.fontes WHERE FALSE;
SELECT sist_med FROM inventario.fontes WHERE FALSE;

SELECT d_dado FROM inventario.fontes WHERE FALSE;
SELECT observacio FROM inventario.fontes WHERE FALSE;

ROLLBACK;
