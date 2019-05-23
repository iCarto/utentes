-- Deploy utentes:alter_tabla_inventario_barragens_add_rename_delete_fields to pg

BEGIN;

ALTER TABLE inventario.barragens ADD COLUMN comprimen integer;
ALTER TABLE inventario.barragens ADD COLUMN npa integer;

ALTER TABLE inventario.barragens RENAME COLUMN vol_total TO capacidad;
ALTER TABLE inventario.barragens RENAME COLUMN coment TO observacio;

ALTER TABLE inventario.barragens DROP COLUMN tip_bar_2;
ALTER TABLE inventario.barragens DROP COLUMN vol_act;



COMMIT;
