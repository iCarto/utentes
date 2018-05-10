-- Deploy utentes:update_renames_codes_to_new_format to pg

BEGIN;

UPDATE utentes.exploracaos SET exp_id = substring(exp_id, 6) || '/ARAN/' || substring(exp_id, 0, 5) where exp_id ~ '.*-.*';
UPDATE utentes.licencias SET lic_nro = substring(lic_nro, 6, 3) || '/ARAN/' || substring(lic_nro, 0, 5) || '/' || substring(tipo_agua, 0, 4) where lic_nro ~ '.*-.*';
UPDATE utentes.actividades_cultivos SET cult_id = substring(cult_id, 6, 3) || '/ARAN/' || substring(cult_id, 0, 5) || '/' || substring(cult_id, 10, 3) where cult_id ~ '.*-.*';
UPDATE utentes.actividades_tanques_piscicolas SET tanque_id = substring(tanque_id, 6, 3) || '/ARAN/' || substring(tanque_id, 0, 5) || '/' || substring(tanque_id, 10, 3) where tanque_id ~ '.*-.*';

CREATE OR REPLACE FUNCTION utentes.validate_exploracao() RETURNS trigger AS $$
BEGIN
    IF NEW.estado_lic IN ('Irregular', 'Licenciada', 'Pendente Parecer Técnico (R. Cad DT)', 'Pendente Emisão Licença (D. Jur)', 'Pendente Firma Licença (Direcção)', 'Utente de facto') THEN
       IF NEW.loc_provin IS NULL THEN RAISE EXCEPTION 'loc_provin es obligatorio %', NEW.exp_id USING ERRCODE = '99001'; END IF;
       IF NEW.loc_distri IS NULL THEN RAISE EXCEPTION 'loc_distri es obligatorio %', NEW.exp_id USING ERRCODE = '99001'; END IF;
       IF NEW.loc_posto IS NULL THEN RAISE EXCEPTION 'loc_posto es obligatorio %', NEW.exp_id USING ERRCODE = '99001'; END IF;
       IF NEW.utente IS NULL THEN RAISE EXCEPTION 'utente es obligatorio %', NEW.exp_id USING ERRCODE = '99001'; END IF;
    END IF;

    IF NOT (NEW.exp_id ~ '^\d{3}/ARA(S|N)/\d{4}$') THEN
       RAISE EXCEPTION 'EXP_ID NO TIENE EL FORMATO CORRECTO %', NEW.exp_id USING ERRCODE = '99001';
    END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION utentes.validate_licencia() RETURNS trigger AS $$
BEGIN
    IF NOT (NEW.lic_nro ~ '^\d{3}/ARA(S|N)/\d{4}/(Sub|Sup)$') THEN
       RAISE EXCEPTION 'LIC_NRO NO TIENE EL FORMATO CORRECTO %', NEW.lic_nro USING ERRCODE = '99001';
    END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validate_licencia
       BEFORE INSERT OR UPDATE ON utentes.licencias
       FOR EACH ROW
       EXECUTE PROCEDURE utentes.validate_licencia();




COMMIT;
