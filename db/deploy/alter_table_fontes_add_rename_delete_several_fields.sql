-- Deploy utentes:alter_table_fontes_add_rename_delete_several_fields to pg

BEGIN;

ALTER TABLE inventario.fontes ADD COLUMN cadastro_a text;
ALTER TABLE inventario.fontes ADD COLUMN lat_lon text;
ALTER TABLE inventario.fontes ADD COLUMN metodo_est text;
ALTER TABLE inventario.fontes ADD COLUMN c_max real;
ALTER TABLE inventario.fontes ADD COLUMN c_soli real;
ALTER TABLE inventario.fontes ADD COLUMN c_real real;
ALTER TABLE inventario.fontes ADD COLUMN exp_id text;
ALTER TABLE inventario.fontes ADD COLUMN lic_nro text;
ALTER TABLE inventario.fontes ADD COLUMN n_licen_a text;
ALTER TABLE inventario.fontes ADD COLUMN abastecim boolean;

ALTER TABLE inventario.fontes ADD COLUMN tipo_agua text
  REFERENCES domains.licencia_tipo_agua(key) ON UPDATE CASCADE ON DELETE NO ACTION;

ALTER TABLE inventario.fontes ADD COLUMN loc_unidad text
  REFERENCES domains.unidade(key) ON UPDATE CASCADE ON DELETE NO ACTION;

ALTER TABLE inventario.fontes ADD COLUMN sist_med text
  REFERENCES domains.fontes_sist_med(key) ON UPDATE CASCADE ON DELETE NO ACTION;

ALTER TABLE inventario.fontes RENAME COLUMN data TO d_dado;
ALTER TABLE inventario.fontes RENAME COLUMN coment TO observacio;

ALTER TABLE inventario.fontes DROP COLUMN fonte;
ALTER TABLE inventario.fontes DROP COLUMN distancia;


COMMIT;
