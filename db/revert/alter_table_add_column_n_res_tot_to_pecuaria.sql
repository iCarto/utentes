-- Revert utentes:alter_table_add_column_n_res_tot_to_pecuaria from pg

BEGIN;

ALTER TABLE utentes.actividades_pecuaria DROP COLUMN n_res_tot;

COMMIT;
