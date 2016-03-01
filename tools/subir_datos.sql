-- add utentes
delete from utentes.utentes;
insert into utentes.utentes (nome) (select distinct utente from public.entrada);

-- add exploracaos
delete from utentes.exploracaos;

alter TABLE public.entrada add column utente_gid integer;
update public.entrada e set utente_gid = u.gid FROM utentes.utentes u WHERE u.nome = e.utente;

insert into utentes.exploracaos (exp_id, exp_name, utente, loc_provin, loc_distri, loc_posto, loc_bacia, loc_subaci, actividade, the_geom) (SELECT n_explorac, 'Exploracao', utente_gid, provincia, distrito, posto, bacia, subacia, actividade, geom FROM public.entrada);

-- add fontes & licencias
alter table public.entrada add column exploracao_gid integer;
update public.entrada e set exploracao_gid = u.gid FROM utentes.exploracaos u WHERE u.exp_id = e.n_explorac;

delete from utentes.fontes;
insert into utentes.fontes (exploracao, tipo_agua, tipo_fonte, c_soli) (select exploracao_gid, tipo, fonte, consumo_so from public.entrada);
delete from utentes.licencias;
insert into utentes.licencias (lic_tipo, lic_nro, exploracao, estado, c_soli_int, c_licencia) (select tipo, '9999-999-99', exploracao_gid, estado, consumo_so, consumo_li from public.entrada);

delete from public.entrada ;
