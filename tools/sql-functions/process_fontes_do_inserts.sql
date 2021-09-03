-- select string_agg(column_name, ', ' order by column_name) from information_schema.columns  where table_schema = 'inventario' and table_name = 'fontes' ;
--select altitude, altitude::numeric, superf, superf::numeric, prof_pozo, prof_pozo::numeric, diametro, diametro::numeric, alt_brocal, alt_brocal::numeric, alt_bomba, alt_bomba::numeric, caudal, caudal::numeric, potencia, potencia::numeric, rep_dista, rep_dista::numeric from tmp_fontes_final;
INSERT INTO inventario.fontes (
    abastecim
    , agricult
    , alt_bomba
    , alt_brocal
    , altitude
    , bacia
    , bombeo
    , cadastro
    , cadastro_a
    , caudal
    , c_max
    , coment_otr
    , c_real
    , c_soli
    , d_dado
    , diametro
    , distrito
    , entidade
    , escritura
    , estado
    , estado_fon
    , exp_id
    , ganaderia
    , geom
--    , gid
    , habitant
    , hora
    , industria
    , lat_lon
    , lic_nro
    , limpezas
    , loc_divisao
    , marca
    , metodo
    , metodo_est
    , n_licen_a
    , n_limpeza
    , nome_prop
    , n_reses
    , nucleo
    , observacio
    , outros
    , posto_adm
    , potencia
    , prof_pozo
    , propiedad
    , provincia
    , red_monit
    , rep_dista
    , reperfor
    , sist_med
    , subacia
    , superf
    , t_bombeo
    , tecnico
    , telefone
    , tip_bomba
    , tip_fonte
    , tip_indus
    , tip_motor
    , tipo_agua
    , tipo_pozo
)
SELECT
abastecim::boolean
, agricult::boolean
, alt_bomba::numeric
, alt_brocal::numeric
, altitude::numeric
, bacia
, bombeo::boolean
, cadastro
, cadastro_a
, caudal::numeric
, c_max::real
-- , comentario
, coment_otr
, c_real::real
, c_soli::real
, d_dado
, diametro::numeric
, distrito
-- , enlace
, entidade
, escritura::boolean
, estado
, estado_fon
-- , excel
, exp_id
-- , field67
, ganaderia::boolean
, geom
-- , gid
, habitant::integer
, hora
, industria::boolean
-- , lat_fo
-- , lat_fo2
, lat_lon
-- , lat_lon2
, lic_nro
, limpezas::boolean
, loc_divisao
-- , long_fo
-- , long_fo2
, marca
, metodo
, metodo_est
, n_licen_a
, n_limpieza::integer
-- , nome
, nome_prop
, n_reses::integer
, nucleo
, observacio
-- , orden
, outros::boolean
, posto_adm
, potencia::numeric
, prof_pozo::numeric
, propiedad
, provincia
, red_monit
, rep_dista::numeric
, reperfor::boolean
-- , rev_loc
, sist_med
, subacia
, superf::numeric
, t_bombeo::integer
, tecnico
, telefone
, tip_bomba
, tip_fonte
, tip_indus
, tip_motor
, tipo_agua
, tipo_pozo
FROM public.tmp_fontes_final
ORDER BY provincia, distrito, posto_adm
;

-- select string_agg(column_name, ', ' order by column_name) from information_schema.columns  where table_schema = 'inventario' and table_name = 'fontes_analise';
INSERT INTO inventario.fontes_analise
(
al
, alcalin_f
, alcalinid
, amonio
, arsenico
, b
, bac_het_t
, bicarbona
, ca
, cadastro
, carbonato
, c_cheiro
, c_conduct
, c_cor
, cd
, cloruros
, cl_resid
, c_nitrat
, c_nitrit
, co
, coli_feca
, coli_tot
, com_most
, cond_most
, conductiv
, cor
, c_ph
, cr3
, cr6
, c_tempera
, cu
, data_anal
, data_most
, dbo
, dqo
, dureza
, e_coli
, fe
, fluoreto
, fosfatos
-- , gid
, hg
, hidroxido
, hora_most
, k
, laborator
, mg
, mn
, mo
, na
, ni
, nitratos
, nitritos
, obser_lab
, oxigeno_d
, par_rango
, pb
, ph
, si
, sol_disol
, sol_suspe
, sol_total
, sulfatos
, temperat
, turbidez
, zn
) SELECT
al::numeric
, alcalin_f::numeric
, alcalinid::numeric
, amonio::numeric
, arsenico::numeric
, b::numeric
, bac_het_t::numeric
, bicarbona::numeric
, ca::numeric
, cadastro
, carbonato::numeric
, c_cheiro
, c_conduct::numeric
, c_cor::integer
, cd::numeric
, cloruros::numeric
, cl_resid::numeric
, c_nitrat
, c_nitrit
, co::numeric
, coli_feca::numeric
, coli_tot::numeric
, com_most
, cond_most
, conductiv::numeric
, cor
, c_ph::numeric
, cr3::numeric
, cr6::numeric
, c_tempera::numeric
, cu::numeric
, data_anal
, data_most
, dbo::numeric
, dqo::numeric
, dureza::numeric
, e_coli::numeric
, fe::numeric
, fluoreto::numeric
, fosfatos::numeric
-- , gid
, hg::numeric
, hidroxido::numeric
, hora_most
, k::numeric
, laborator
, mg::numeric
, mn::numeric
, mo::numeric
, na::numeric
, ni::numeric
, nitratos::numeric
, nitritos::numeric
, obser_lab
, oxigeno_d::numeric
, par_rango::boolean
, pb::numeric
, ph::numeric
, si::numeric
, sol_disol::numeric
, sol_suspe::numeric
, sol_total::numeric
, sulfatos::numeric
, temperat::numeric
, turbidez::numeric
, zn::numeric
FROM tmp_fontes_analise
ORDER BY cadastro
;

INSERT INTO inventario.fontes_carac_hidro (
cadastro
, conductiv
, data_lit
-- , gid
, hora_lit
, q_aquifer
, tipo_aqui
, tipo_cama
) SELECT
cadastro
, conductiv::numeric
, null -- , data_hid CHEQUEAR.
--, gid
, hora_hid
, q_aquifer::numeric
, tipo_aqui
, tipo_cama
FROM tmp_fontes_carac_hidro
ORDER BY cadastro;

INSERT INTO inventario.fontes_litologia (
cadastro
, camada
, carac_lit
, data_lit
, descricao
-- , gid
, hora_lit
, litologia
, profundid
) SELECT
cadastro
, camada
, carac_lit
, data_lit::date -- revisar para cuando no sea null
, descricao
-- , gid
, hora_lit
, litologia
, profundid::integer
FROM tmp_fontes_litolia
ORDER BY cadastro;

INSERT INTO inventario.quantidade_agua (
cadastro
, data_ens
, gid
, hora_ens
, n_estatic
, n_freatic
, nivel_agua
, n_semi_co
, prof_campo
, q_extraer
, quan_agua
) SELECT
cadastro
, data_ens
, gid
, hora_ens
, n_estatic::numeric
, n_freatic::numeric
, nivel_agua::numeric
, n_semi_co::numeric
, prof_campo::numeric
, q_extraer::numeric
, quan_auga::numeric
FROM tmp_fontes_quant_agua
ORDER BY cadastro;
