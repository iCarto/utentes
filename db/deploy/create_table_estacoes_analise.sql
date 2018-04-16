-- Deploy utentes:create_table_estacoes_analise to pg

BEGIN;

CREATE TABLE inventario.estacoes_analise
(
  gid serial NOT NULL,
  cod_estac text NOT NULL,
  estazon text,
  data_med date NOT NULL,
  hora_med character varying(6),
  laborator text,
  temperat numeric(10,2),
  cor text,
  turbidez numeric(10,2),
  conductiv numeric(10,2),
  ph numeric(10,2),
  alcalin_f numeric(10,2),
  alcalinid numeric(10,2),
  carbonato numeric(10,2),
  bicarbona numeric(10,2),
  hidroxido numeric(10,2),
  dureza numeric(10,2),
  oxigeno_d numeric(10,2),
  dbo numeric(10,2),
  dqo numeric(10,2),
  mo numeric(10,2),
  sol_suspe numeric(10,2),
  sol_disol numeric(10,2),
  sol_total numeric(10,2),
  nitratos numeric(10,2),
  nitritos numeric(10,2),
  coli_feca numeric(10,2),
  coli_tot numeric(10,2),
  e_coli numeric(10,2),
  bac_het_t numeric(10,2),
  cl_resid numeric(10,2),
  cloruros numeric(10,2),
  fosfatos numeric(10,2),
  sulfatos numeric(10,2),
  fluoreto numeric(10,2),
  ca numeric(10,2),
  mg numeric(10,2),
  amonio numeric(10,2),
  arsenico numeric(10,2),
  k numeric(10,2),
  na numeric(10,2),
  si numeric(10,2),
  fe numeric(10,2),
  mn numeric(10,2),
  al numeric(10,2),
  b numeric(10,2),
  cd numeric(10,2),
  co numeric(10,2),
  cr3 numeric(10,2),
  cr6 numeric(10,2),
  cu numeric(10,2),
  hg numeric(10,2),
  ni numeric(10,2),
  pb numeric(10,2),
  zn numeric(10,2),
  comen_lab text,
  CONSTRAINT estacoes_analise_pkey PRIMARY KEY (gid), 
  CONSTRAINT analise_cod_estac_fkey FOREIGN KEY (cod_estac)
      REFERENCES inventario.estacoes (cod_estac) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);

COMMIT;
