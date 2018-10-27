-- Deploy sixhiara:create_tables_cartogracia_base to pg

BEGIN;

SET client_min_messages TO WARNING;

CREATE TABLE "cbase"."provinces" (gid serial,
"id" int4,
"provincia" varchar(30),
"censo_2007" int4,
"orig_fid" int4,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."provinces" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."provinces" USING GIST ("geom");

CREATE TABLE "cbase"."cidades_vilas" (gid serial,
"nome" varchar(25),
"descrição" varchar(32),
geom geometry(Point, 32737)
);
ALTER TABLE "cbase"."cidades_vilas" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."cidades_vilas" USING GIST ("geom");

CREATE TABLE "cbase"."aldeias" (gid serial,
"nome" varchar(50),
"posto" varchar(30),
"distrito" varchar(30),
"provincia" varchar(30),
"pob_total" numeric(10,0),
"pob_masc" numeric(10,0),
"pob_fem" numeric(10,0),
"agregados" numeric(10,0),
geom geometry(Point, 32737)
);
ALTER TABLE "cbase"."aldeias" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."aldeias" USING GIST ("geom");



CREATE TABLE "cbase"."fontes_analiticas_2014" (gid serial,
"fonte" varchar(254),
"cod_fonte" varchar(254),
"red_monit" varchar(254),
"data_most" varchar(11),
"hora_most" varchar(6),
"c_tempera" varchar(9),
"c_conduct" varchar(9),
"c_cor" varchar(9),
"c_cheiro" varchar(50),
"c_ph" varchar(9),
"c_nitrat" varchar(9),
"c_nitrit" varchar(9),
"par_rango" varchar(9),
"cond_most" varchar(9),
"com_most" varchar(9),
"laborator" varchar(9),
"data_anal" varchar(9),
"temperat" varchar(9),
"cor" varchar(50),
"turbidez" varchar(9),
"conductiv" varchar(9),
"ph" varchar(9),
"alcalin_f" varchar(9),
"alcalinid" varchar(9),
"carbonato" varchar(9),
"bicarbona" varchar(9),
"hidroxido" varchar(9),
"dureza" varchar(9),
"oxigeno_d" varchar(9),
"dbo" varchar(9),
"dqo" varchar(9),
"mo" varchar(9),
"sol_suspe" varchar(9),
"sol_disol" varchar(9),
"sol_total" varchar(9),
"nitratos" varchar(9),
"nitritos" varchar(9),
"coli_feca" varchar(9),
"coli_tot" varchar(9),
"e_coli" varchar(9),
"bac_het_t" varchar(9),
"cl_resid" varchar(9),
"cloruros" varchar(9),
"fosfatos" varchar(9),
"ca" varchar(9),
"mg" varchar(9),
"amonio" varchar(9),
"arsenico" varchar(9),
"k" varchar(9),
"na" varchar(9),
"si" varchar(9),
"fe" varchar(9),
"mn" varchar(9),
"al" varchar(9),
"b" varchar(9),
"cd" varchar(9),
"co" varchar(9),
"cr3" varchar(9),
"cr6" varchar(9),
"cu" varchar(9),
"hg" varchar(9),
"ni" varchar(9),
"pb" varchar(9),
"zn" varchar(9),
"comen_lab" varchar(50),
"con_campo" int2,
"colif_lab" int2,
"ph_campo" float8,
"fe_labor" float8,
geom geometry(Point, 32737)
);
ALTER TABLE "cbase"."fontes_analiticas_2014" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."fontes_analiticas_2014" USING GIST ("geom");

CREATE TABLE "cbase"."fontes_proteccao" (gid serial,
"tipo_acti" varchar(50),
"tipo_prot" varchar(50),
"peri_prot" int4,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."fontes_proteccao" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."fontes_proteccao" USING GIST ("geom");

CREATE TABLE "cbase"."rejilla_50000" (gid serial,
"code" varchar(10),
"scale" float8,
"dimx_cm" float8,
"dimy_cm" float8,
"overlap" float8,
"rot_rad" float8,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."rejilla_50000" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."rejilla_50000" USING GIST ("geom");

CREATE TABLE "cbase"."fontes_analiticas" (gid serial,
"fonte" varchar(254),
"cod_fonte" varchar(254),
"tip_fonte" varchar(254),
"entidade" varchar(254),
"tecnico" varchar(254),
"data" varchar(254),
"hora" varchar(254),
"provincia" varchar(254),
"distrito" varchar(254),
"posto_adm" varchar(254),
"nucleo" varchar(254),
"altitude" float8,
"distancia" float8,
"propiedad" varchar(254),
"nome_prop" varchar(254),
"telefone" varchar(254),
"escritura" int2,
"domestico" int2,
"habitant" int2,
"agricult" int2,
"superf" float8,
"ganaderia" int2,
"n_reses" int2,
"industria" int2,
"tip_indus" varchar(254),
"outros" int2,
"coment_otr" varchar(254),
"tipo_pozo" varchar(254),
"prof_pozo" float8,
"diametro" float8,
"alt_brocal" float8,
"bombeo" int2,
"tip_bomba" varchar(254),
"tip_motor" varchar(254),
"marca" varchar(254),
"alt_bomba" float8,
"caudal" float8,
"t_bombeo" int2,
"potencia" float8,
"estado" varchar(254),
"reperfor" int2,
"rep_dista" float8,
"limpezas" int2,
"coment" varchar(254),
"red_monit" varchar(50),
"a_conduct" float8,
"a_ph" float8,
"a_tempera" float8,
"a_nitrato" float8,
"a_nitrito" float8,
"a_contami" varchar(254),
"l_ph" float8,
"l_conduct" float8,
"l_ntu" float8,
"l_deposit" varchar(254),
"l_cor" varchar(254),
"l_sabor" varchar(254),
"l_cheiro" varchar(254),
"l_no3_mgl" float8,
"l_no2_mgl" float8,
"l_nh4_mgl" float8,
"l_cl_mgl" float8,
"l_caco3" float8,
"l_caco3_t" float8,
"l_hco3_mg" float8,
"l_co3_mgl" float8,
"l_oh_mgl" float8,
"l_so4_mgl" float8,
"l_dureza" float8,
"l_f_mgl" float8,
"l_ca_mgl" float8,
"l_mg_mgl" float8,
"l_fe_mgl" float8,
"l_o2_mo" float8,
"l_sio2_mgl" float8,
"l_ecoli" float8,
"l_colt" float8,
"l_colfec" float8,
geom geometry(Point, 32737)
);
ALTER TABLE "cbase"."fontes_analiticas" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."fontes_analiticas" USING GIST ("geom");

CREATE TABLE "cbase"."fontes_analiticas_2012" (gid serial,
"fonte" varchar(254),
"cod_fonte" varchar(254),
"red_monit" varchar(50),
"a_conduct" float8,
"a_ph" float8,
"a_tempera" float8,
"a_nitrato" float8,
"a_nitrito" float8,
"a_contami" varchar(254),
"l_ph" float8,
"l_conduct" float8,
"l_ntu" float8,
"l_deposit" varchar(254),
"l_cor" varchar(254),
"l_sabor" varchar(254),
"l_cheiro" varchar(254),
"l_no3_mgl" float8,
"l_no2_mgl" float8,
"l_nh4_mgl" float8,
"l_cl_mgl" float8,
"l_caco3" float8,
"l_caco3_t" float8,
"l_hco3_mg" float8,
"l_co3_mgl" float8,
"l_oh_mgl" float8,
"l_so4_mgl" float8,
"l_dureza" float8,
"l_f_mgl" float8,
"l_ca_mgl" float8,
"l_mg_mgl" float8,
"l_fe_mgl" float8,
"l_o2_mo" float8,
"l_sio2_mgl" float8,
"l_ecoli" float8,
"l_colt" float8,
"l_colfec" float8,
geom geometry(Point, 32737)
);
ALTER TABLE "cbase"."fontes_analiticas_2012" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."fontes_analiticas_2012" USING GIST ("geom");

CREATE TABLE "cbase"."piezometria" (gid serial,
"id" int4,
"cota_piezo" int2,
geom geometry(MultiLineStringZM, 32737)
);
ALTER TABLE "cbase"."piezometria" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."piezometria" USING GIST ("geom");

CREATE TABLE "cbase"."rejilla_350000" (gid serial,
"code" varchar(10),
"scale" float8,
"dimx_cm" float8,
"dimy_cm" float8,
"overlap" float8,
"rot_rad" float8,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."rejilla_350000" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."rejilla_350000" USING GIST ("geom");

CREATE TABLE "cbase"."acuiferos_base" (gid serial,
"layer" varchar(254),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."acuiferos_base" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."acuiferos_base" USING GIST ("geom");

CREATE TABLE "cbase"."albufeiras" (gid serial,
"barragem" varchar(254),
"cod_barra" varchar(254),
"fonte_loc" varchar(50),
"fiab_loc" varchar(80),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."albufeiras" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."albufeiras" USING GIST ("geom");

CREATE TABLE "cbase"."bacias" (gid serial,
"nome" varchar(50),
"subacia" varchar(50),
"area" float8,
"rio_prin" varchar(50),
"long_rio" float8,
"afluentes" varchar(250),
"pre_media" float8,
"esc_medio" float8,
"n_estac_h" numeric(10,0),
"n_utentes" int4,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."bacias" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."bacias" USING GIST ("geom");





CREATE TABLE "cbase"."postos_administrativos" (gid serial,
"posto" varchar(30),
"distrito" varchar(30),
"provincia" varchar(30),
"censo_2007" int4,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."postos_administrativos" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."postos_administrativos" USING GIST ("geom");


CREATE TABLE "cbase"."distritos" (gid serial,
"distrito" varchar(30),
"provincia" varchar(50),
"censo_2007" int4,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."distritos" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."distritos" USING GIST ("geom");

CREATE TABLE "cbase"."provincia" (gid serial,
"provincia" varchar(30),
"censo_2007" int4,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."provincia" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."provincia" USING GIST ("geom");


CREATE TABLE "cbase"."paises_limitrofes" (gid serial,
"name_spani" varchar(50),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."paises_limitrofes" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."paises_limitrofes" USING GIST ("geom");


CREATE TABLE "cbase"."comunicaciones" (gid serial,
"length" numeric,
"shape_leng" numeric,
geom geometry(MultiLineString, 32737));
ALTER TABLE "cbase"."comunicaciones" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."comunicaciones" USING GIST ("geom");

CREATE TABLE "cbase"."estradas" (gid serial,
"codigo" varchar(10),
"nome" varchar(42),
"tipo" varchar(50),
"provincia" varchar(30),
"material" varchar(16),
"pto_inicio" varchar(17),
"pto_final" varchar(17),
"s_fic" varchar(4),
"cond" varchar(4),
"manut96" varchar(11),
"reason" varchar(47),
"length" float8,
geom geometry(MultiLineString, 32737)
);
ALTER TABLE "cbase"."estradas" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."estradas" USING GIST ("geom");

CREATE TABLE "cbase"."elevaciones" (gid serial,
"lower" numeric,
"upper" numeric,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."elevaciones" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."elevaciones" USING GIST ("geom");

CREATE TABLE "cbase"."curvas_nivel_10m" (gid serial,
"id" numeric(10,0),
"contour" float8,
geom geometry(MultiLineString, 32737)
);
ALTER TABLE "cbase"."curvas_nivel_10m" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."curvas_nivel_10m" USING GIST ("geom");

CREATE TABLE "cbase"."zp_costa" (gid serial,
"nome" varchar(50),
"tipo_prot" varchar(50),
"distan_m" int2,
"restriçoe" varchar(250),
"leis" varchar(250),
"artigo" varchar(250),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."zp_costa" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."zp_costa" USING GIST ("geom");

CREATE TABLE "cbase"."zp_fontes" (gid serial,
"tipo_acti" varchar(250),
"tipo_prot" varchar(250),
"peri_prot" int2,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."zp_fontes" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."zp_fontes" USING GIST ("geom");

CREATE TABLE "cbase"."zp_albufeiras" (gid serial,
"nome" varchar(250),
"tipo_prot" varchar(250),
"distan_m" int2,
"restriçoe" varchar(250),
"leis" varchar(250),
"artigo" varchar(250),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."zp_albufeiras" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."zp_albufeiras" USING GIST ("geom");

CREATE TABLE "cbase"."zp_nascentes" (gid serial,
"nome" varchar(50),
"tipo_prot" varchar(250),
"distan_m" int2,
"restriçoe" varchar(250),
"leis" varchar(250),
"artigo" varchar(250),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."zp_nascentes" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."zp_nascentes" USING GIST ("geom");

CREATE TABLE "cbase"."lixeira" (gid serial,
"nome" varchar(254),
"estado" varchar(50),
"area_ha" numeric,
"provincia" varchar(80),
"distrito" varchar(24),
"posto_adm" varchar(254),
"fonte_loc" varchar(254),
"fiab_loc" varchar(254),
"fonte_info" varchar(254),
"fiab_info" varchar(254),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."lixeira" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."lixeira" USING GIST ("geom");

CREATE TABLE "cbase"."pontos_vertido" (gid serial,
"nome" varchar(254),
"tipo" varchar(254),
"provincia" varchar(80),
"distrito" varchar(24),
"posto_adm" varchar(254),
"fonte_loc" varchar(254),
"fiab_loc" varchar(254),
"fonte_info" varchar(254),
"fiab_info" varchar(254),
geom geometry(Point, 32737)
);
ALTER TABLE "cbase"."pontos_vertido" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."pontos_vertido" USING GIST ("geom");

CREATE TABLE "cbase"."centros_saude" (gid serial,
"nome" varchar(254),
"tipo" varchar(254),
"tipo_cod" varchar(254),
"n_camas" float8,
"provincia" varchar(80),
"distrito" varchar(24),
"posto" varchar(254),
"fonte_loc" varchar(254),
"fiab_loc" varchar(254),
"fonte_info" varchar(254),
"fiab_info" varchar(254),
geom geometry(Point, 32737)
);
ALTER TABLE "cbase"."centros_saude" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."centros_saude" USING GIST ("geom");

CREATE TABLE "cbase"."cemiterios" (gid serial,
"nome" varchar(254),
"estado" varchar(50),
"provincia" varchar(80),
"distrito" varchar(24),
"posto" varchar(254),
"fonte_loc" varchar(254),
"fiab_loc" varchar(254),
"fonte_info" varchar(254),
"fiab_info" varchar(254),
geom geometry(Point, 32737)
);
ALTER TABLE "cbase"."cemiterios" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."cemiterios" USING GIST ("geom");

CREATE TABLE "cbase"."hoteis" (gid serial,
"nome" varchar(254),
"provincia" varchar(80),
"distrito" varchar(24),
"posto_adm" varchar(254),
"fonte_loc" varchar(254),
"fiab_loc" varchar(254),
"fonte_info" varchar(254),
"fiab_info" varchar(254),
geom geometry(Point, 32737)
);
ALTER TABLE "cbase"."hoteis" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."hoteis" USING GIST ("geom");

CREATE TABLE "cbase"."bombas_combustivel" (gid serial,
"nome" varchar(50),
"tipo" varchar(50),
"provincia" varchar(50),
"distrito" varchar(50),
"posto_adm" varchar(50),
"fonte_loc" varchar(250),
"fiab_loc" varchar(250),
"fonte_info" varchar(250),
"fiab_info" varchar(250),
geom geometry(Point, 32737)
);
ALTER TABLE "cbase"."bombas_combustivel" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."bombas_combustivel" USING GIST ("geom");

CREATE TABLE "cbase"."industria_agro_pecuarias" (gid serial,
"nome" varchar(250),
"tipo" varchar(250),
"estado" varchar(250),
"area" float8,
"provincia" varchar(50),
"distrito" varchar(50),
"posto_adm" varchar(50),
"fonte_loc" varchar(250),
"fiab_loc" varchar(250),
"fonte_info" varchar(250),
"fiab_info" varchar(50),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."industria_agro_pecuarias" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."industria_agro_pecuarias" USING GIST ("geom");

CREATE TABLE "cbase"."areas_exploracao_petroleo_gas" (gid serial,
"nome" varchar(50),
"tipo" varchar(250),
"recurso" varchar(50),
"recurso_a" varchar(50),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."areas_exploracao_petroleo_gas" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."areas_exploracao_petroleo_gas" USING GIST ("geom");

CREATE TABLE "cbase"."areas_exploracao_mineira" (gid serial,
"nome" varchar(50),
"tipo" varchar(250),
"estado" varchar(50),
"mineral" varchar(50),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."areas_exploracao_mineira" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."areas_exploracao_mineira" USING GIST ("geom");

CREATE TABLE "cbase"."industria_agro_pecuarias_menor" (gid serial,
"nome" varchar(250),
"tipo" varchar(250),
"estado" varchar(50),
"provincia_" varchar(50),
"distrito" varchar(50),
"posto_adm" varchar(50),
"fonte_loc" varchar(50),
"fiab_loc" varchar(50),
"fonte_info" varchar(50),
"fiab_info" varchar(50),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."industria_agro_pecuarias_menor" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."industria_agro_pecuarias_menor" USING GIST ("geom");

CREATE TABLE "cbase"."industrias" (gid serial,
"nome" varchar(250),
"tipo" varchar(50),
"estado" varchar(50),
"provincia" varchar(50),
"distrito" varchar(50),
"posto_adm" varchar(50),
"fonte_loc" varchar(50),
"fiab_loc" varchar(50),
"fonte_info" varchar(50),
"fiab_info" varchar(50),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."industrias" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."industrias" USING GIST ("geom");

CREATE TABLE "cbase"."centro_educacional" (gid serial,
"nome" varchar(254),
"gestao" varchar(254),
"provincia" varchar(80),
"distrito" varchar(254),
"posto_adm" varchar(254),
"fonte_loc" varchar(80),
"fiab_loc" varchar(80),
"fonte_info" varchar(80),
"fiab_info" varchar(80),
geom geometry(Point, 32737)
);
ALTER TABLE "cbase"."centro_educacional" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."centro_educacional" USING GIST ("geom");

CREATE TABLE "cbase"."geomorfologia_mzq" (gid serial,
"geomorf" varchar(100),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."geomorfologia_mzq" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."geomorfologia_mzq" USING GIST ("geom");

CREATE TABLE "cbase"."usos_da_terra" (gid serial,
"ocup1" numeric,
"tipo1" varchar(254),
"pct_ocup1" numeric,
"ocup2" numeric,
"tipo2" varchar(254),
"pct_ocup2" numeric,
"ocup3" numeric,
"tipo3" varchar(254),
"pct_ocup3" numeric,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."usos_da_terra" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."usos_da_terra" USING GIST ("geom");

CREATE TABLE "cbase"."litologia" (gid serial,
"area" numeric,
"perimeter" numeric,
"lito_" float8,
"lito_id" float8,
"formação" varchar(24),
"classe" varchar(200),
"acres" numeric,
"lenda" varchar(250),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."litologia" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."litologia" USING GIST ("geom");

CREATE TABLE "cbase"."geomorfologia250_lbrn_cd" (gid serial,
"unidad" varchar(75),
"hectareas" numeric,
"posto" varchar(30),
"distrito" varchar(30),
"provincia" varchar(30),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."geomorfologia250_lbrn_cd" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."geomorfologia250_lbrn_cd" USING GIST ("geom");

CREATE TABLE "cbase"."geologia250_lbrn_cd" (gid serial,
"codigo_lit" varchar(60),
"litoestrac" varchar(200),
"unidad_lit" varchar(200),
"formaÇao" varchar(200),
"grupo_lito" varchar(50),
"subgrupo_l" varchar(50),
"eon_geo" varchar(50),
"era_geo" varchar(50),
"period_geo" varchar(50),
"epoca_geo" varchar(50),
"hectareas" numeric,
"posto" varchar(30),
"distrito" varchar(30),
"provincia" varchar(30),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."geologia250_lbrn_cd" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."geologia250_lbrn_cd" USING GIST ("geom");

CREATE TABLE "cbase"."solos" (gid serial,
"caract" varchar(100),
"class_fao" varchar(100),
"mosoeqa" varchar(10),
"textura" varchar(25),
"drenagem" varchar(20),
"profundi__" varchar(14),
"profundida" varchar(50),
"acidez_alc" varchar(30),
"mater_rgan" varchar(26),
"sal_superf" varchar(15),
"first_moso" varchar(10),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."solos" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."solos" USING GIST ("geom");

CREATE TABLE "cbase"."batimetria" (gid serial,
"scalerank" numeric,
"featurecla" varchar(32),
"depth" int2,
"fid_1" float8,
"id" int4,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."batimetria" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."batimetria" USING GIST ("geom");

CREATE TABLE "cbase"."rios" (gid serial,
"nome" varchar(50),
"longitude" numeric,
"cau_medio" numeric,
"mes_agua" varchar(250),
"bacia" varchar(50),
"subacia" varchar(50),
geom geometry(MultiLineString, 32737)
);
ALTER TABLE "cbase"."rios" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."rios" USING GIST ("geom");

CREATE TABLE "cbase"."grandes_lagos" (gid serial,
"iso" varchar(7),
"country" varchar(54),
"f_code_des" varchar(254),
"hyc_descri" varchar(254),
"name" varchar(254),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."grandes_lagos" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."grandes_lagos" USING GIST ("geom");

CREATE TABLE "cbase"."estacoes_evaporacion" (gid serial,
"stn_name" varchar(254),
"stn_qual" varchar(254),
"eleva" float8,
"begin_date" date,
"end_date" date,
"province" varchar(254),
geom geometry(Point, 32737)
);
ALTER TABLE "cbase"."estacoes_evaporacion" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."estacoes_evaporacion" USING GIST ("geom");

CREATE TABLE "cbase"."lagos_embalses" (gid serial,
"toponimo" varchar(50),
"area_km2" float8,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."lagos_embalses" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."lagos_embalses" USING GIST ("geom");

CREATE TABLE "cbase"."aras" (gid serial,
"id" float8,
"sigla" varchar(1),
"ara" varchar(20),
"moc_km2" float8,
"tot_km2" float8,
"moc_km" float8,
"tot_km" float8,
"z23" float8,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."aras" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."aras" USING GIST ("geom");

CREATE TABLE "cbase"."concessoes_florestais" (gid serial,
"area" numeric,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."concessoes_florestais" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."concessoes_florestais" USING GIST ("geom");


CREATE TABLE "cbase"."areas_conservacao" (gid serial,
"tipo_area" varchar(50),
"toponimo" varchar(50),
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."areas_conservacao" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."areas_conservacao" USING GIST ("geom");


CREATE TABLE "cbase"."reserva_zona_tampao" (gid serial,
"nomes" varchar(60),
"shape_area" numeric,
geom geometry(MultiPolygon, 32737)
);
ALTER TABLE "cbase"."reserva_zona_tampao" ADD PRIMARY KEY (gid);
CREATE INDEX ON "cbase"."reserva_zona_tampao" USING GIST ("geom");


-- GRANT SELECT ON ALL TABLES IN SCHEMA cbase TO cbase_read;
-- GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA cbase TO cbase_write;

COMMIT;
