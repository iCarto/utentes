-- TODO review data to fit in constraints (create fake data if necessary)
-- drop constrainsts for test data
ALTER TABLE utentes.exploracaos ALTER COLUMN exp_name DROP NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN loc_provin DROP NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN loc_distri DROP NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN loc_posto DROP NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN pagos DROP NOT NULL;
ALTER TABLE utentes.exploracaos DROP CONSTRAINT exploracaos_exp_name_key;
ALTER TABLE utentes.fontes ALTER COLUMN tipo_agua DROP NOT NULL;
ALTER TABLE utentes.licencias ALTER COLUMN lic_nro DROP NOT NULL;
ALTER TABLE utentes.licencias ALTER COLUMN lic_tipo DROP NOT NULL;
ALTER TABLE utentes.licencias DROP CONSTRAINT licencias_lic_nro_key;
ALTER TABLE utentes.utentes DROP CONSTRAINT utentes_nuit_key;
-- end of drop constraints for test data

-- -- add constraints after drop test data
-- ALTER TABLE utentes.exploracaos ALTER COLUMN exp_name SET NOT NULL;
-- ALTER TABLE utentes.exploracaos ALTER COLUMN loc_provin SET NOT NULL;
-- ALTER TABLE utentes.exploracaos ALTER COLUMN loc_distri SET NOT NULL;
-- ALTER TABLE utentes.exploracaos ALTER COLUMN loc_posto SET NOT NULL;
-- ALTER TABLE utentes.exploracaos ALTER COLUMN pagos SET NOT NULL;
-- ALTER TABLE utentes.exploracaos ADD CONSTRAINT exploracaos_exp_name_key UNIQUE (exp_name);
-- ALTER TABLE utentes.fontes ALTER COLUMN tipo_agua SET NOT NULL;
-- ALTER TABLE utentes.licencias ALTER COLUMN lic_nro SET NOT NULL;
-- ALTER TABLE utentes.licencias ALTER COLUMN lic_tipo SET NOT NULL;
-- ALTER TABLE utentes.licencias ADD CONSTRAINT licencias_lic_nro_key UNIQUE (lic_nro);
-- ALTER TABLE utentes.utentes ADD CONSTRAINT utentes_nuit_key UNIQUE (nuit);
-- -- add constraints after drop test data

delete from utentes.utentes;

insert into utentes.utentes (nome) (select distinct utente from public.entrada);

delete from utentes.exploracaos;

alter TABLE public.entrada add column utente_gid integer;
update public.entrada e set utente_gid = u.gid FROM utentes.utentes u WHERE u.nome = e.utente;

insert into utentes.exploracaos (exp_id, utente, loc_provin, loc_distri, loc_posto, loc_bacia, loc_subaci, actividade, the_geom) (SELECT n_explorac, utente_gid, provincia, distrito, posto, bacia, subacia, actividade, geom FROM public.entrada);

alter table public.entrada add column exploracao_gid integer;
update public.entrada e set exploracao_gid = u.gid FROM utentes.exploracaos u WHERE u.exp_id = e.n_explorac;

delete from utentes.fontes;
insert into utentes.fontes (exploracao, tipo_agua, tipo_fonte, c_soli) (select exploracao_gid, tipo, fonte, consumo_so from public.entrada);
delete from utentes.licencias;
insert into utentes.licencias (lic_tipo, exploracao, estado, c_soli_int, c_licencia) (select tipo, exploracao_gid, estado, consumo_so, consumo_li from public.entrada);

delete from public.entrada ;
