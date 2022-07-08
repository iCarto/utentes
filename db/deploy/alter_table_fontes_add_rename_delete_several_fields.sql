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

ALTER TABLE inventario.fontes RENAME COLUMN domestico TO abastecim;

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

INSERT INTO domains.fonte_tipo (key, parent) VALUES ('Poço aberto', 'Subterrânea'), ('Piezómetro', 'Subterrânea');

INSERT INTO inventario_dominios.tip_fonte (key, parent) SELECT key, parent FROM domains.fonte_tipo b WHERE b.key is not null ON CONFLICT (key) DO UPDATE SET parent = EXCLUDED.parent;
UPDATE inventario_dominios.tip_fonte SET ordering = row_number FROM (SELECT row_number() over (order by key), key akey FROM inventario_dominios.tip_fonte where key != 'Outros') a WHERE key = akey;
update inventario_dominios.tip_fonte set ordering = aor from (select max(ordering) + 1 as aor from inventario_dominios.tip_fonte where key != 'Outros') a where key = 'Outros';

INSERT INTO inventario_dominios.propiedad(key) VALUES ('ARA');

COMMIT;
