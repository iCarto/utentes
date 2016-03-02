-- check domains
select e.gid, d.value from utentes.exploracaos e join utentes.domains d on e.loc_provin = d.value;
select e.gid, d.value from utentes.exploracaos e left outer join utentes.domains d on e.loc_distri = d.value where d.gid is null order by e.gid;
select e.gid, d.value from utentes.exploracaos e left outer join utentes.domains d on e.loc_posto = d.value where d.gid is null order by e.gid;
select e.gid, d.value from utentes.exploracaos e left outer join utentes.domains d on e.loc_subaci = d.value where d.gid is null order by e.gid;
select e.gid, e.actividade, d.value from utentes.exploracaos e left outer join utentes.domains d on e.actividade = d.value where d.gid is null order by e.gid;
select e.gid, e.tipo_agua, d.value from utentes.fontes e left outer join utentes.domains d on e.tipo_agua = d.value where d.gid is null order by e.gid;
select e.gid, e.lic_tipo, d.value from utentes.licencias e left outer join utentes.domains d on e.lic_tipo = d.value where d.gid is null order by e.gid;
select e.gid, e.estado, d.value from utentes.licencias e left outer join utentes.domains d on e.estado = d.value where d.gid is null order by e.gid;
