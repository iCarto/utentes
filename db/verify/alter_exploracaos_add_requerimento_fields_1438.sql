-- Verify utentes:alter_exploracaos_add_requerimento_fields_1438 on pg

BEGIN;

SELECT created_at, carta_re, ficha_pe, ident_pro, certi_reg, duat, licen_am, mapa, licen_fu, carta_re_v, ficha_pe_v, ident_pro_v, certi_reg_v, duat_v, licen_am_v, mapa_v, licen_fu_v, anali_doc, soli_visit, p_unid, p_tec, doc_legal, p_juri, p_rel, req_obs, ara FROM utentes.exploracaos WHERE false;

ROLLBACK;
