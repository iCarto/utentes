-- Deploy utentes:create_tables_fontes_litologia_carac_hid to pg

BEGIN;

CREATE TABLE inventario_dominios.litologia (
  category text default 'litologia',
  key text UNIQUE,
  value text,
  ordering integer,
  parent text,
  tooltip text
);

INSERT INTO inventario_dominios.litologia (key) VALUES
  ('Areia'),
  ('Calcareo'),
  ('Grês'),
  ('Terra'),
  ('Argila'),
  ('Areao'),
  ('Arenito'),
  ('Basalto'),
  ('Cascalho'),
  ('Cinzas'),
  ('Conglomerado'),
  ('Couraça'),
  ('Dolorito'),
  ('Marga'),
  ('Riolito'),
  ('Silty');

CREATE TABLE inventario_dominios.carac_lit (
  category text default 'litologia',
  key text UNIQUE,
  value text,
  ordering integer,
  parent text,
  tooltip text
);

INSERT INTO inventario_dominios.carac_lit (key) VALUES
  ('Fina'),
  ('Média'),
  ('Grossa'),
  ('Argilossa'),
  ('Marga'),
  ('Silte'),
  ('Arenosa'),
  ('Fracturada');

CREATE TABLE inventario.fontes_litologia (
  gid SERIAL PRIMARY KEY,
  cadastro varchar(254) NOT NULL,
  data_lit date,
  hora_lit varchar(6),
  camada varchar(254),
  litologia text REFERENCES inventario_dominios.litologia (key)
      ON UPDATE CASCADE
      ON DELETE NO ACTION,
  profundid integer,
  descricao text,
  carac_lit text REFERENCES inventario_dominios.carac_lit (key)
      ON UPDATE CASCADE
      ON DELETE NO ACTION
);

ALTER TABLE inventario.fontes_litologia
  ADD CONSTRAINT fontes_litologia_cadastro_fkey
  FOREIGN KEY (cadastro)
  REFERENCES inventario.fontes (cadastro) MATCH SIMPLE
  ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE inventario_dominios.tipo_cama (
  category text default 'carac_hidro',
  key text UNIQUE,
  value text,
  ordering integer,
  parent text,
  tooltip text
);

INSERT INTO inventario_dominios.tipo_cama (key) VALUES
  ('Aquífero'),
  ('Aquitarde'),
  ('Aquiclude');

CREATE TABLE inventario_dominios.tipo_aqui (
  category text default 'carac_hidro',
  key text UNIQUE,
  value text,
  ordering integer,
  parent text,
  tooltip text
);

INSERT INTO inventario_dominios.tipo_aqui (key) VALUES
  ('Freático'),
  ('Semi-confinado'),
  ('Confinado');

CREATE TABLE inventario.fontes_carac_hidro (
  gid SERIAL PRIMARY KEY,
  cadastro varchar(254) NOT NULL,
  data_lit date,
  hora_lit varchar(6),
  tipo_cama text REFERENCES inventario_dominios.tipo_cama (key)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
  tipo_aqui text REFERENCES inventario_dominios.tipo_aqui (key)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
  q_aquifer numeric(10,2),
  conductiv numeric(10,2)
  );

ALTER TABLE inventario.fontes_carac_hidro
  ADD CONSTRAINT fontes_carac_hidro_cadastro_fkey
  FOREIGN KEY (cadastro)
  REFERENCES inventario.fontes (cadastro) MATCH SIMPLE
  ON UPDATE CASCADE ON DELETE CASCADE;

COMMIT;
