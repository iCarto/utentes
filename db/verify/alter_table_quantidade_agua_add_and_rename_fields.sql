-- Verify utentes:alter_table_quantidade_agua_add_and_rename_fields on pg

BEGIN;

SELECT data_ens FROM inventario.quantidade_agua WHERE FALSE;
SELECT hora_ens FROM inventario.quantidade_agua WHERE FALSE;

SELECT n_estatic FROM inventario.quantidade_agua WHERE FALSE;
SELECT n_freatic FROM inventario.quantidade_agua WHERE FALSE;
SELECT n_semi_co FROM inventario.quantidade_agua WHERE FALSE;
SELECT q_extraer FROM inventario.quantidade_agua WHERE FALSE;

ROLLBACK;
