-- Revert utentes:update_renames_codes_to_new_format from pg

BEGIN;

DROP TRIGGER validate_licencia ON utentes.licencias;
DROP FUNCTION utentes.validate_licencia();

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


UPDATE utentes.exploracaos SET exp_id = substring(exp_id, 10, 4) || '-' || substring(exp_id, 0, 4) where exp_id ~ '.*/.*';
UPDATE utentes.licencias SET lic_nro = substring(lic_nro, 10, 4) || '-' || substring(lic_nro, 0, 4) || '-' || CASE WHEN tipo_agua = 'Superficial' THEN '002' ELSE '001' END where lic_nro ~ '.*/.*';

UPDATE utentes.actividades_cultivos SET cult_id = substring(cult_id, 10, 4) || '-' || substring(cult_id, 0, 4) || '-' || substring(cult_id, 15, 3) where cult_id ~ '.*/.*';
UPDATE utentes.actividades_tanques_piscicolas SET tanque_id = substring(tanque_id, 10, 4) || '-' || substring(tanque_id, 0, 4) || '-' || substring(tanque_id, 15, 3) where tanque_id ~ '.*/.*';


COMMIT;
