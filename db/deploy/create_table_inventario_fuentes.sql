-- Deploy utentes:create_table_inventario_fuentes to pg

BEGIN;

CREATE TABLE "utentes"."inventario_fontes" (
gid SERIAL PRIMARY KEY,
"fonte" varchar(254),
"cod_fonte" varchar(254) UNIQUE NOT NULL,
"tip_fonte" varchar(254),
"red_monit" varchar(254),
"entidade" varchar(254),
"tecnico" varchar(254),
"data" varchar(100),
"hora" varchar(254),
"provincia" varchar(254),
"distrito" varchar(254),
"posto_adm" varchar(254),
"nucleo" varchar(254),
"altitude" numeric(10,2),
"distancia" numeric(10,2),
"propiedad" varchar(254),
"nome_prop" varchar(254),
"telefone" varchar(254),
"escritura" boolean,
"domestico" boolean,
"habitant" integer,
"agricult" boolean,
"superf" numeric(10,2),
"ganaderia" boolean,
"n_reses" integer,
"industria" boolean,
"tip_indus" varchar(254),
"outros" boolean,
"coment_otr" varchar(254),
"estado_fon" varchar(254),
"tipo_pozo" varchar(254),
"prof_pozo" numeric(10,2),
"diametro" numeric(10,2),
"alt_brocal" numeric(10,2),
"bombeo" boolean,
"tip_bomba" varchar(254),
"tip_motor" varchar(254),
"marca" varchar(254),
"alt_bomba" numeric(10,2),
"caudal" numeric(10,2),
"t_bombeo" integer,
"potencia" numeric(10,2),
"estado" varchar(254),
"reperfor" boolean,
"rep_dista" numeric(10,2),
"limpezas" boolean,
"coment" varchar(254),
metodo varchar(254),
n_limpeza integer,
geom geometry('POINT', 32737)
);
CREATE INDEX ON "utentes"."inventario_fontes" USING GIST ("geom");

-- ALTER TABLE utentes.inventario_fontes OWNER TO utentes;

COMMIT;
