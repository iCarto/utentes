-- Verify utentes:alter_table_add_column_n_res_tot_to_pecuaria on pg

BEGIN;

SELECT n_res_tot FROM utentes.actividades_pecuaria;

ROLLBACK;
