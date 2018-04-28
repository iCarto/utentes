-- Deploy utentes:alter_exploracaos_add_requerimento_fields_1438 to pg

BEGIN;

ALTER TABLE utentes.exploracaos ADD COLUMN created_at timestamp NOT NULL DEFAULT now();

ALTER TABLE utentes.exploracaos ADD COLUMN carta_re boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN ficha_pe boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN ident_pro boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN certi_reg boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN duat boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN licen_am boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN mapa boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN licen_fu boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN carta_re_v boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN ficha_pe_v boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN ident_pro_v boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN certi_reg_v boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN duat_v boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN licen_am_v boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN mapa_v boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN licen_fu_v boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN anali_doc boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN soli_visit boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN p_unid boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN p_tec boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN doc_legal boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN p_juri boolean not null default false;
ALTER TABLE utentes.exploracaos ADD COLUMN p_rel boolean not null default false;

ALTER TABLE utentes.exploracaos ADD COLUMN req_obs JSONB;
UPDATE utentes.exploracaos SET req_obs = '[{"created_at": null, "autor": null, "text": null, "state": null}, {"created_at": null, "autor": null, "text": null, "state": null}]';


ALTER TABLE utentes.exploracaos ADD COLUMN ara TEXT ;
UPDATE utentes.exploracaos SET ara = 'ARAN';
ALTER TABLE utentes.exploracaos ALTER COLUMN ara SET NOT NULL;

ALTER TABLE utentes.exploracaos ALTER COLUMN loc_provin DROP NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN loc_distri DROP NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN loc_posto DROP NOT NULL;
ALTER TABLE utentes.exploracaos ALTER COLUMN utente DROP NOT NULL;

CREATE OR REPLACE FUNCTION utentes.validate_exploracao() RETURNS trigger AS $$
BEGIN
    IF NEW.estado_lic IN ('Irregular', 'Licenciada', 'Pendente Parecer Técnico (R. Cad DT)', 'Pendente Emisão Licença (D. Jur)', 'Pendente Firma Licença (Direcção)', 'Utente de facto') THEN
       IF NEW.loc_provin IS NULL THEN RAISE EXCEPTION 'loc_provin es obligatorio %', NEW.exp_id USING ERRCODE = '99001'; END IF;
       IF NEW.loc_distri IS NULL THEN RAISE EXCEPTION 'loc_distri es obligatorio %', NEW.exp_id USING ERRCODE = '99001'; END IF;
       IF NEW.loc_posto IS NULL THEN RAISE EXCEPTION 'loc_posto es obligatorio %', NEW.exp_id USING ERRCODE = '99001'; END IF;
       IF NEW.utente IS NULL THEN RAISE EXCEPTION 'utente es obligatorio %', NEW.exp_id USING ERRCODE = '99001'; END IF;
    END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validate_exploracao
       BEFORE INSERT OR UPDATE ON utentes.exploracaos
       FOR EACH ROW
       EXECUTE PROCEDURE utentes.validate_exploracao();


COMMIT;
