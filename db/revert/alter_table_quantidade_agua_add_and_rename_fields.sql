-- Revert utentes:alter_table_quantidade_agua_add_and_rename_fields from pg

BEGIN;

ALTER TABLE inventario.quantidade_agua RENAME COLUMN data_ens TO data;
ALTER TABLE inventario.quantidade_agua RENAME COLUMN hora_ens TO hora;

ALTER TABLE inventario.quantidade_agua DROP COLUMN n_estatic;
ALTER TABLE inventario.quantidade_agua DROP COLUMN n_freatic;
ALTER TABLE inventario.quantidade_agua DROP COLUMN n_semi_co;
ALTER TABLE inventario.quantidade_agua DROP COLUMN q_extraer;

COMMIT;
