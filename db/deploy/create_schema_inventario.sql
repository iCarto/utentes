-- Deploy sixhiara:create_schema_inventario to pg

BEGIN;

SET client_min_messages TO error;
\set ECHO none
\set QUIET 1

-- CREATE SCHEMA inventario AUTHORIZATION sixhiara_owner;
CREATE SCHEMA inventario;

CREATE TABLE "inventario"."fontes" (
gid SERIAL PRIMARY KEY,
"fonte" varchar(254),
"cod_fonte" varchar(254) NOT NULL UNIQUE,
"tip_fonte" varchar(254) REFERENCES inventario_dominios.tip_fonte(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"red_monit" varchar(254)  REFERENCES inventario_dominios.red_monit(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"entidade" varchar(254),
"tecnico" varchar(254),
"data" varchar(100),
"hora" varchar(254),
"provincia" varchar(254) REFERENCES inventario_dominios.provincia(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"distrito" varchar(254),
"posto_adm" varchar(254),
"nucleo" varchar(254),
"altitude" numeric(10,2),
"distancia" numeric(10,2),
"propiedad" varchar(254) REFERENCES inventario_dominios.propiedad(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
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
"estado_fon" varchar(254) REFERENCES inventario_dominios.estado(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"tipo_pozo" varchar(254) REFERENCES inventario_dominios.tipo_pozo(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
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
"estado" varchar(254) REFERENCES inventario_dominios.estado_ampliado(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"reperfor" boolean,
"rep_dista" numeric(10,2),
"limpezas" boolean,
"coment" varchar(254),
metodo varchar(254),
n_limpeza integer,
geom geometry('POINT', 32737),

FOREIGN KEY (provincia, distrito) REFERENCES inventario_dominios.distrito (parent, key)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
   FOREIGN KEY (distrito, posto_adm) REFERENCES inventario_dominios.posto (parent, key)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);
CREATE INDEX ON "inventario"."fontes" USING GIST ("geom");

CREATE TABLE "inventario"."analise" (
gid SERIAL PRIMARY KEY,
"cod_fonte" text NOT NULL REFERENCES inventario.fontes(cod_fonte)
	    ON UPDATE CASCADE
	    ON DELETE CASCADE,
"fonte" text,
"data_most" date NOT NULL,
"hora_most" varchar(6),
"c_tempera" numeric(10,2),
"c_conduct" numeric(10,2),
"c_cor" integer,
"c_cheiro" text,
"c_ph" numeric(10,2),
"c_nitrat" text REFERENCES inventario_dominios.c_nitrat(key)
	   ON UPDATE CASCADE
	   ON DELETE NO ACTION,
"c_nitrit" text REFERENCES inventario_dominios.c_nitrit(key)
	   ON UPDATE CASCADE
	   ON DELETE NO ACTION,
"par_rango" boolean,
"cond_most" text REFERENCES inventario_dominios.cond_most(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"com_most" text,
"laborator" text,
"data_anal" date,
"temperat" numeric(10,2),
"cor" text,
"turbidez" numeric(10,2),
"conductiv" numeric(10,2),
"ph" numeric(10,2),
"alcalin_f" numeric(10,2),
"alcalinid" numeric(10,2),
"carbonato" numeric(10,2),
"bicarbona" numeric(10,2),
"hidroxido" numeric(10,2),
"dureza" numeric(10,2),
"oxigeno_d" numeric(10,2),
"dbo" numeric(10,2),
"dqo" numeric(10,2),
"mo" numeric(10,2),
"sol_suspe" numeric(10,2),
"sol_disol" numeric(10,2),
"sol_total" numeric(10,2),
"nitratos" numeric(10,2),
"nitritos" numeric(10,2),
"coli_feca" numeric(10,2),
"coli_tot" numeric(10,2),
"e_coli" numeric(10,2),
"bac_het_t" numeric(10,2),
"cl_resid" numeric(10,2),
"cloruros" numeric(10,2),
"fosfatos" numeric(10,2),
"ca" numeric(10,2),
"mg" numeric(10,2),
"amonio" numeric(10,2),
"arsenico" numeric(10,2),
"k" numeric(10,2),
"na" numeric(10,2),
"si" numeric(10,2),
"fe" numeric(10,2),
"mn" numeric(10,2),
"al" numeric(10,2),
"b" numeric(10,2),
"cd" numeric(10,2),
"co" numeric(10,2),
"cr3" numeric(10,2),
"cr6" numeric(10,2),
"cu" numeric(10,2),
"hg" numeric(10,2),
"ni" numeric(10,2),
"pb" numeric(10,2),
"zn" numeric(10,2),
"comen_lab" text
);

CREATE TABLE "inventario"."quantidade_agua" (
gid SERIAL PRIMARY KEY,
"cod_fonte" varchar(50) REFERENCES inventario.fontes(cod_fonte)
	    ON UPDATE CASCADE
	    ON DELETE CASCADE,
"data" date NOT NULL,
"hora" varchar(6),
"quan_agua" numeric(10,2),
"q_extraer" numeric(10,2)
);



CREATE TABLE "inventario"."acuiferos" (
gid SERIAL PRIMARY KEY,
"acuifero" varchar(50),
"cod_acuif" varchar(50) NOT NULL UNIQUE,
"tipo_hidr" varchar(254) REFERENCES inventario_dominios.tipo_hidr(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"tipo_lito" varchar(254) REFERENCES inventario_dominios.tipo_lito(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"tipo_poro" varchar(50) REFERENCES inventario_dominios.tipo_poro(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"geologia" varchar(254),
"profundid" varchar(50),
"cumprimen" varchar(50),
"coment" varchar(50),
geom geometry('MULTIPOLYGON', 32737)
);
CREATE INDEX ON "inventario"."acuiferos" USING GIST ("geom");



CREATE TABLE "inventario"."estacoes" (
gid SERIAL PRIMARY KEY,
"estazon" varchar(254),
"cod_estac" varchar(254) NOT NULL UNIQUE,
"tip_estac" varchar(254) REFERENCES inventario_dominios.tip_estac(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"provincia" varchar(254) REFERENCES inventario_dominios.provincia(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"distrito" varchar(254),
"posto_adm" varchar(254),
"nucleo" varchar(254),
"altitude" numeric(10,2),
"bacia" varchar(254) REFERENCES inventario_dominios.bacia(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
subacia text,
"rio" varchar(254),
"estado" varchar(254) REFERENCES inventario_dominios.estado_ampliado(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"ano_const" integer,
"gestao" varchar(254) REFERENCES inventario_dominios.gestao_estacoes(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"n_tecnico" integer,
"responsab" varchar(254),
"telefone" varchar(254),
"ano_inici" integer,
"ano_fin" integer,
"n_anos" integer,
"frec_toma" varchar(254) REFERENCES inventario_dominios.frecuencia(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"frec_regi" varchar(254) REFERENCES inventario_dominios.frecuencia(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"nivel" boolean,
"n_precis" varchar(254) REFERENCES inventario_dominios.precisao(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"lin_em" boolean,
"n_lin_em" integer,
"n_outros" boolean,
"n_t_outro" varchar(254),
"velocidad" boolean,
"v_precis" varchar(254) REFERENCES inventario_dominios.precisao(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"molinetes" boolean,
"n_molinet" integer,
"v_outros" boolean,
"v_t_outro" varchar(254),
"caudal" boolean,
"pluviomet" boolean,
"tip_pluvi" varchar(254) REFERENCES inventario_dominios.tip_pluvi(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"n_pluviom" integer,
"coment" varchar(254),
"et_id" float8,
geom geometry('POINT', 32737),

FOREIGN KEY (provincia, distrito) REFERENCES inventario_dominios.distrito (parent, key)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
   FOREIGN KEY (distrito, posto_adm) REFERENCES inventario_dominios.posto (parent, key)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
FOREIGN KEY (bacia, subacia) REFERENCES inventario_dominios.subacia (parent, key)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
    
);
CREATE INDEX ON "inventario"."estacoes" USING GIST ("geom");



CREATE TABLE "inventario"."dados_hidrometricos" (
gid SERIAL PRIMARY KEY,
"cod_estac" varchar(50) NOT NULL REFERENCES inventario.estacoes(cod_estac)
	    ON UPDATE CASCADE
	    ON DELETE CASCADE,
"estazon" varchar(50),
"ano" text,
"n_med_ja" numeric(10,2),
"n_max_ja" numeric(10,2),
"n_min_ja" numeric(10,2),
"n_med_fe" numeric(10,2),
"n_max_fe" numeric(10,2),
"n_min_fe" numeric(10,2),
"n_med_ma" numeric(10,2),
"n_max_ma" numeric(10,2),
"n_min_ma" numeric(10,2),
"n_med_ab" numeric(10,2),
"n_max_ab" numeric(10,2),
"n_min_ab" numeric(10,2),
"n_med_mo" numeric(10,2),
"n_max_mo" numeric(10,2),
"n_min_mo" numeric(10,2),
"n_med_ju" numeric(10,2),
"n_max_ju" numeric(10,2),
"n_min_ju" numeric(10,2),
"n_med_jl" numeric(10,2),
"n_max_jl" numeric(10,2),
"n_min_jl" numeric(10,2),
"n_med_ag" numeric(10,2),
"n_max_ag" numeric(10,2),
"n_min_ag" numeric(10,2),
"n_med_se" numeric(10,2),
"n_max_se" numeric(10,2),
"n_min_se" numeric(10,2),
"n_med_ou" numeric(10,2),
"n_max_ou" numeric(10,2),
"n_min_ou" numeric(10,2),
"n_med_no" numeric(10,2),
"n_max_no" numeric(10,2),
"n_min_no" numeric(10,2),
"n_med_de" numeric(10,2),
"n_max_de" numeric(10,2),
"n_min_de" numeric(10,2),
"n_med_ano" numeric(10,2),
"n_max_ano" numeric(10,2),
"n_min_ano" numeric(10,2),
"q_med_ja" numeric(10,2),
"q_max_ja" numeric(10,2),
"q_min_ja" numeric(10,2),
"q_med_fe" numeric(10,2),
"q_max_fe" numeric(10,2),
"q_min_fe" numeric(10,2),
"q_med_ma" numeric(10,2),
"q_max_ma" numeric(10,2),
"q_min_ma" numeric(10,2),
"q_med_ab" numeric(10,2),
"q_max_ab" numeric(10,2),
"q_min_ab" numeric(10,2),
"q_med_mo" numeric(10,2),
"q_max_mo" numeric(10,2),
"q_min_mo" numeric(10,2),
"q_med_ju" numeric(10,2),
"q_max_ju" numeric(10,2),
"q_min_ju" numeric(10,2),
"q_med_jl" numeric(10,2),
"q_max_jl" numeric(10,2),
"q_min_jl" numeric(10,2),
"q_med_ag" numeric(10,2),
"q_max_ag" numeric(10,2),
"q_min_ag" numeric(10,2),
"q_med_se" numeric(10,2),
"q_max_se" numeric(10,2),
"q_min_se" numeric(10,2),
"q_med_ou" numeric(10,2),
"q_max_ou" numeric(10,2),
"q_min_ou" numeric(10,2),
"q_med_no" numeric(10,2),
"q_max_no" numeric(10,2),
"q_min_no" numeric(10,2),
"q_med_de" numeric(10,2),
"q_max_de" numeric(10,2),
"q_min_de" numeric(10,2),
"q_med_ano" numeric(10,2),
"q_max_ano" numeric(10,2),
"q_min_ano" numeric(10,2),
"e_med_ja" numeric(10,2),
"e_max_ja" numeric(10,2),
"e_min_ja" numeric(10,2),
"e_med_fe" numeric(10,2),
"e_max_fe" numeric(10,2),
"e_min_fe" numeric(10,2),
"e_med_ma" numeric(10,2),
"e_max_ma" numeric(10,2),
"e_min_ma" numeric(10,2),
"e_med_ab" numeric(10,2),
"e_max_ab" numeric(10,2),
"e_min_ab" numeric(10,2),
"e_med_mo" numeric(10,2),
"e_max_mo" numeric(10,2),
"e_min_mo" numeric(10,2),
"e_med_ju" numeric(10,2),
"e_max_ju" numeric(10,2),
"e_min_ju" numeric(10,2),
"e_med_jl" numeric(10,2),
"e_max_jl" numeric(10,2),
"e_min_jl" numeric(10,2),
"e_med_ag" numeric(10,2),
"e_max_ag" numeric(10,2),
"e_min_ag" numeric(10,2),
"e_med_se" numeric(10,2),
"e_max_se" numeric(10,2),
"e_min_se" numeric(10,2),
"e_med_ou" numeric(10,2),
"e_max_ou" numeric(10,2),
"e_min_ou" numeric(10,2),
"e_med_no" numeric(10,2),
"e_max_no" numeric(10,2),
"e_min_no" numeric(10,2),
"e_med_de" numeric(10,2),
"e_max_de" numeric(10,2),
"e_min_de" numeric(10,2),
"e_med_ano" numeric(10,2),
"e_max_ano" numeric(10,2),
"e_min_ano" numeric(10,2)
);



CREATE TABLE "inventario"."dados_pluviometricos" (
gid SERIAL PRIMARY KEY,
"cod_estac" varchar(50) NOT NULL REFERENCES inventario.estacoes(cod_estac)
	    ON UPDATE CASCADE
	    ON DELETE CASCADE,
"estazon" varchar(50),
"ano" text,
"to_mes_ja" numeric(10,2),
"d_chuv_ja" integer,
"media_ja" numeric(10,2),
"max_d_ja" numeric(10,2),
"to_mes_fe" numeric(10,2),
"d_chuv_fe" integer,
"media_fe" numeric(10,2),
"max_d_fe" numeric(10,2),
"to_mes_ma" numeric(10,2),
"d_chuv_ma" integer,
"media_ma" numeric(10,2),
"max_d_ma" numeric(10,2),
"to_mes_ab" numeric(10,2),
"d_chuv_ab" integer,
"media_ab" numeric(10,2),
"max_d_ab" numeric(10,2),
"to_mes_mo" numeric(10,2),
"d_chuv_mo" integer,
"media_mo" numeric(10,2),
"max_d_mo" numeric(10,2),
"to_mes_ju" numeric(10,2),
"d_chuv_ju" integer,
"media_ju" numeric(10,2),
"max_d_ju" numeric(10,2),
"to_mes_jl" numeric(10,2),
"d_chuv_jl" integer,
"media_jl" numeric(10,2),
"max_d_jl" numeric(10,2),
"to_mes_ag" numeric(10,2),
"d_chuv_ag" integer,
"media_ag" numeric(10,2),
"max_d_ag" numeric(10,2),
"to_mes_se" numeric(10,2),
"d_chuv_se" integer,
"media_se" numeric(10,2),
"max_d_se" numeric(10,2),
"to_mes_ou" numeric(10,2),
"d_chuv_ou" integer,
"media_ou" numeric(10,2),
"max_d_ou" numeric(10,2),
"to_mes_no" numeric(10,2),
"d_chuv_no" integer,
"media_no" numeric(10,2),
"max_d_no" numeric(10,2),
"to_mes_de" numeric(10,2),
"d_chuv_de" integer,
"media_de" numeric(10,2),
"max_d_de" numeric(10,2),
"c_tot_ano" numeric(10,2),
"d_chu_tot" integer,
"c_med_ano" numeric(10,2),
"c_max_ano" numeric(10,2),
"d_chu_con" integer,
"d_no_chu" integer
);

CREATE TABLE "inventario"."barragens" (
gid SERIAL PRIMARY KEY,
"barragem" varchar(254),
"cod_barra" varchar(254) NOT NULL UNIQUE,
"tip_barra" varchar(254) REFERENCES inventario_dominios.tip_barra(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"provincia" varchar(254) REFERENCES inventario_dominios.provincia(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"distrito" varchar(254),
"posto_adm" varchar(254),
"nucleo" varchar(254),
"altitude" numeric(10,2),
"bacia" varchar(254) REFERENCES inventario_dominios.bacia(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
subacia text,
"rio" varchar(254),
"estado" varchar(254) REFERENCES inventario_dominios.estado_ampliado(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"ano_const" integer,
"gestao" varchar(254) REFERENCES inventario_dominios.gestao(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"responsab" varchar(254),
"telefone" varchar(254),
"tip_bar_2" varchar(254),
"vol_total" integer,
"vol_act" integer,
"h_altitud" numeric(10,2),
"u_hidroel" boolean,
"u_irriga" boolean,
"u_abast" boolean,
"estrutura" varchar(254),
"inspecoes" boolean,
"n_inspec" integer,
"fonte_loc" varchar(254),
"fonte_inf" varchar(254),
"fiab_info" varchar(254) REFERENCES inventario_dominios.fiab_info(key)
	    ON UPDATE CASCADE
	    ON DELETE NO ACTION,
"coment" varchar(254),
geom geometry('POINT', 32737),
FOREIGN KEY (provincia, distrito) REFERENCES inventario_dominios.distrito (parent, key)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
   FOREIGN KEY (distrito, posto_adm) REFERENCES inventario_dominios.posto (parent, key)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
FOREIGN KEY (bacia, subacia) REFERENCES inventario_dominios.subacia (parent, key)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);

CREATE INDEX ON "inventario"."barragens" USING GIST ("geom");




-- GRANT USAGE ON SCHEMA inventario TO inventario_read;
-- GRANT SELECT ON ALL TABLES IN SCHEMA inventario TO inventario_read;

-- GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA inventario TO inventario_write;




COMMIT;
