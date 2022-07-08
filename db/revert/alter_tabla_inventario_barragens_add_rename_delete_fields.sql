-- Revert utentes:alter_tabla_inventario_barragens_add_rename_delete_fields from pg

BEGIN;

ALTER TABLE inventario.barragens DROP COLUMN comprimen;
ALTER TABLE inventario.barragens DROP COLUMN npa;

ALTER TABLE inventario.barragens RENAME COLUMN capacidad TO vol_total;
ALTER TABLE inventario.barragens RENAME COLUMN observacio TO coment;

ALTER TABLE inventario.barragens ADD COLUMN tip_bar_2 text;
ALTER TABLE inventario.barragens ADD COLUMN vol_act integer;

COMMIT;
