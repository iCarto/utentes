-- Revert utentes:alter_exploracaos_add_requerimento_fields_1438 from pg

BEGIN;

ALTER TABLE utentes.exploracaos DROP COLUMN created_at;

ALTER TABLE utentes.exploracaos DROP COLUMN carta_re;
ALTER TABLE utentes.exploracaos DROP COLUMN ficha_pe;
ALTER TABLE utentes.exploracaos DROP COLUMN ident_pro;
ALTER TABLE utentes.exploracaos DROP COLUMN certi_reg;
ALTER TABLE utentes.exploracaos DROP COLUMN duat;
ALTER TABLE utentes.exploracaos DROP COLUMN licen_am;
ALTER TABLE utentes.exploracaos DROP COLUMN mapa;
ALTER TABLE utentes.exploracaos DROP COLUMN licen_fu;
ALTER TABLE utentes.exploracaos DROP COLUMN carta_re_v;
ALTER TABLE utentes.exploracaos DROP COLUMN ficha_pe_v;
ALTER TABLE utentes.exploracaos DROP COLUMN ident_pro_v;
ALTER TABLE utentes.exploracaos DROP COLUMN certi_reg_v;
ALTER TABLE utentes.exploracaos DROP COLUMN duat_v;
ALTER TABLE utentes.exploracaos DROP COLUMN licen_am_v;
ALTER TABLE utentes.exploracaos DROP COLUMN mapa_v;
ALTER TABLE utentes.exploracaos DROP COLUMN licen_fu_v;
ALTER TABLE utentes.exploracaos DROP COLUMN anali_doc;
ALTER TABLE utentes.exploracaos DROP COLUMN soli_visit;
ALTER TABLE utentes.exploracaos DROP COLUMN p_unid;
ALTER TABLE utentes.exploracaos DROP COLUMN p_tec;
ALTER TABLE utentes.exploracaos DROP COLUMN doc_legal;
ALTER TABLE utentes.exploracaos DROP COLUMN p_juri;
ALTER TABLE utentes.exploracaos DROP COLUMN p_rel;

ALTER TABLE utentes.exploracaos DROP COLUMN req_obs;

ALTER TABLE utentes.exploracaos DROP COLUMN ara;

ALTER TABLE utentes.exploracaos ALTER COLUMN loc_provin SET NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN loc_distri SET NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN loc_posto SET NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN utente SET NOT NULL;

DROP TRIGGER validate_exploracao ON utentes.exploracaos;
DROP FUNCTION utentes.validate_exploracao();




COMMIT;
