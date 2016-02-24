delete from utentes.utentes;
insert into utentes.utentes (nome) (select distinct utente from public.entrada);


delete from utentes.exploracaos;

alter TABLE public.entrada add column utente_gid integer;
update public.entrada e set utente_gid = u.gid FROM utentes.utentes u WHERE u.nome = e.utente;


insert into utentes.exploracaos (exp_id, utente, loc_provin, loc_distri, loc_posto, loc_bacia, loc_sub, actividade, the_geom) (SELECT n_explorac, utente_gid, provincia, distrito, posto, bacia, subacia, actividade, geom FROM public.entrada);

alter table public.entrada add column exploracao_gid integer;
update public.entrada e set exploracao_gid = u.gid FROM utentes.exploracaos u WHERE u.exp_id = e.n_explorac;

delete from utentes.fontes;
insert into utentes.fontes (exploracao, tipo_agua, tipo_fonte, c_requerid) (select exploracao_gid, tipo, fonte, consumo_so from public.entrada);
delete from utentes.licencias;
insert into utentes.licencias (lic_tipo, exploracao, estado, c_requerid, c_licencia) (select tipo, exploracao_gid, estado, consumo_so, consumo_li from public.entrada);

delete from public.entrada ;
