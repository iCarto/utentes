-- add utentes
delete from utentes.utentes;
insert into utentes.utentes (nome) (select distinct utente from public.entrada);

-- add exploracaos
delete from utentes.exploracaos;

alter TABLE public.entrada add column utente_gid integer;
update public.entrada e set utente_gid = u.gid FROM utentes.utentes u WHERE u.nome = e.utente;

insert into utentes.exploracaos (exp_id, exp_name, utente, loc_provin, loc_distri, loc_posto, loc_bacia, loc_subaci, the_geom) (SELECT n_explorac, 'Exploracao', utente_gid, provincia, distrito, posto, bacia, subacia, geom FROM public.entrada);

-- add fontes & licencias
alter table public.entrada add column exploracao_gid integer;
update public.entrada e set exploracao_gid = u.gid FROM utentes.exploracaos u WHERE u.exp_id = e.n_explorac;

delete from utentes.fontes;
insert into utentes.fontes (exploracao, tipo_agua, tipo_fonte, c_soli) (select exploracao_gid, tipo, fonte, consumo_so from public.entrada);
delete from utentes.licencias;
insert into utentes.licencias (lic_tipo, lic_nro, exploracao, estado, c_soli_int, c_licencia) (select tipo, n_explorac || '-001', exploracao_gid, replace(estado, 'ă','ã'), consumo_so, consumo_li from public.entrada);



insert into utentes.actividades (exploracao, tipo) (SELECT exploracao_gid, actividade from public.entrada);

insert into utentes.actividades_industria (gid, c_estimado) (SELECT gid, random() * 100 from utentes.actividades where exploracao IN ( select exploracao_gid from public.entrada where actividade = 'Indústria' ) );
insert into utentes.actividades_agricultura_rega (gid, c_estimado) (SELECT gid, random() * 100 from utentes.actividades where exploracao IN ( select exploracao_gid from public.entrada where actividade = 'Agricultura-Regadia' ) );
insert into utentes.actividades_abastecemento (gid, c_estimado, dotacao) (SELECT gid, random() * 100, random()*1000 from utentes.actividades where exploracao IN ( select exploracao_gid from public.entrada where actividade = 'Abastecimento' ) );

DELETE FROM utentes.actividades WHERE exploracao = (SELECT gid from utentes.exploracaos WHERE exp_id = '2010-029');
INSERT INTO utentes.actividades (exploracao, tipo) (SELECT gid, 'Pecuária' from utentes.exploracaos WHERE exp_id = '2010-029');
INSERT INTO utentes.actividades_pecuaria (gid, c_estimado) (SELECT gid, 100 FROM utentes.actividades where exploracao = (SELECT gid from utentes.exploracaos WHERE exp_id = '2010-029'));
INSERT INTO utentes.actividades_reses (actividade, c_estimado, reses_tipo, reses_nro, c_res) VALUES (
  (SELECT gid FROM utentes.actividades where exploracao = (SELECT gid from utentes.exploracaos WHERE exp_id = '2010-029')),
  10,
  'Ovino (Ovelhas)',
  100,
  1000
 );
INSERT INTO utentes.actividades_reses (actividade, c_estimado, reses_tipo, reses_nro, c_res) VALUES (
   (SELECT gid FROM utentes.actividades where exploracao = (SELECT gid from utentes.exploracaos WHERE exp_id = '2010-029')),
   20,
   'Avícola (Aves)',
   200,
   2000
);
INSERT INTO utentes.actividades_reses (actividade, c_estimado, reses_tipo, reses_nro, c_res) VALUES (
    (SELECT gid FROM utentes.actividades where exploracao = (SELECT gid from utentes.exploracaos WHERE exp_id = '2010-029')),
    30,
    'Equino (Cavalos)',
    300,
    3000
);

INSERT INTO utentes.actividades_cultivos (cult_id, actividade, c_estimado, cultivo, rega, eficiencia, area) VALUES (
  '2010-022-01',
  (SELECT gid FROM utentes.actividades where exploracao = (SELECT gid from utentes.exploracaos WHERE exp_id = '2010-022')),
  10,
  'Arroz',
  'Asperção',
  0.1,
  1
);

INSERT INTO utentes.actividades_cultivos (cult_id, actividade, c_estimado, cultivo, rega, eficiencia, area, the_geom) VALUES (
  '2010-022-02',
  (SELECT gid FROM utentes.actividades where exploracao = (SELECT gid from utentes.exploracaos WHERE exp_id = '2010-022')),
  20,
  'Açúcar',
  'Goteo',
  0.2,
  2,
  (SELECT ST_Multi(ST_Buffer(ST_Translate(ST_Centroid(the_geom), 500, 500), 100)) from utentes.exploracaos WHERE exp_id = '2010-022')
);

INSERT INTO utentes.actividades_cultivos (cult_id, actividade, c_estimado, cultivo, rega, eficiencia, area, the_geom) VALUES (
  '2010-022-03',
  (SELECT gid FROM utentes.actividades where exploracao = (SELECT gid from utentes.exploracaos WHERE exp_id = '2010-022')),
  30,
  'Açúcar',
  'Goteo',
  0.3,
  3,
  (SELECT ST_Multi(ST_Buffer(ST_Translate(ST_Centroid(the_geom), 100, 100), 50)) from utentes.exploracaos WHERE exp_id = '2010-022')
);

delete from public.entrada ;
