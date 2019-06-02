-- Revert utentes:alter_table_fontes_add_rename_delete_several_fields from pg

BEGIN;

ALTER TABLE inventario.fontes DROP COLUMN cadastro_a;
ALTER TABLE inventario.fontes DROP COLUMN lat_lon;
ALTER TABLE inventario.fontes DROP COLUMN metodo_est;
ALTER TABLE inventario.fontes DROP COLUMN c_max;
ALTER TABLE inventario.fontes DROP COLUMN c_soli;
ALTER TABLE inventario.fontes DROP COLUMN c_real;
ALTER TABLE inventario.fontes DROP COLUMN exp_id;
ALTER TABLE inventario.fontes DROP COLUMN lic_nro;
ALTER TABLE inventario.fontes DROP COLUMN n_licen_a;
ALTER TABLE inventario.fontes RENAME COLUMN abastecim TO domestico;

ALTER TABLE inventario.fontes DROP COLUMN tipo_agua;
ALTER TABLE inventario.fontes DROP COLUMN loc_unidad;
ALTER TABLE inventario.fontes DROP COLUMN sist_med;

ALTER TABLE inventario.fontes RENAME COLUMN d_dado TO data;
ALTER TABLE inventario.fontes RENAME COLUMN observacio TO coment;

ALTER TABLE inventario.fontes ADD COLUMN fonte text;
ALTER TABLE inventario.fontes ADD COLUMN distancia numeric(10,2);

UPDATE inventario_dominios.tip_fonte SET parent = null;
DELETE FROM inventario_dominios.tip_fonte WHERE key IN ('Outros', 'Lago', 'Rio', 'Mar', 'Piezómetro');
UPDATE inventario_dominios.tip_fonte SET ordering = null;
DELETE FROM domains.fonte_tipo WHERE key IN ('Poço aberto', 'Piezómetro');

DELETE FROM inventario_dominios.propiedad WHERE key IN ('ARA');

COMMIT;
