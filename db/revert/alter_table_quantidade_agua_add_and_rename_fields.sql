-- Revert utentes:alter_table_quantidade_agua_add_and_rename_fields from pg

BEGIN;

ALTER TABLE inventario.quantidade_agua RENAME COLUMN data_ens TO data;
ALTER TABLE inventario.quantidade_agua RENAME COLUMN hora_ens TO hora;

ALTER TABLE inventario.quantidade_agua DROP COLUMN n_estatic;
ALTER TABLE inventario.quantidade_agua DROP COLUMN n_freatic;
ALTER TABLE inventario.quantidade_agua DROP COLUMN n_semi_co;
ALTER TABLE inventario.quantidade_agua DROP COLUMN q_extraer;

ALTER TABLE inventario.quantidade_agua ALTER COLUMN data_ens SET NOT NULL;
ALTER TABLE inventario.quantidade_agua ALTER COLUMN nivel_agua SET NOT NULL;
ALTER TABLE inventario.quantidade_agua ALTER COLUMN prof_campo SET NOT NULL;

-- No aplico el rever a propósito
-- ALTER TABLE inventario.quantidade_agua ALTER COLUMN cadastro SET TYPE character varying(50);

COMMIT;
