-- Revert utentes:modify_ara_domain_and_code_validations from pg

BEGIN;

UPDATE domains.ara SET value = 'Zambeze' WHERE value = 'ARAZ';
UPDATE domains.ara SET value = 'Sul' WHERE value = 'ARAS';
UPDATE domains.ara SET value = 'Norte' WHERE value = 'ARAN';

CREATE OR REPLACE FUNCTION utentes.validate_exploracao()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    IF NEW.estado_lic IN ('Irregular', 'Licenciada', 'Pendente Parecer Técnico (R. Cad DT)', 'Pendente Emisão Licença (D. Jur)', 'Pendente Firma Licença (Direcção)', 'Utente de facto') THEN
       IF NEW.loc_provin IS NULL THEN RAISE EXCEPTION 'loc_provin es obligatorio %', NEW.exp_id USING ERRCODE = '99001'; END IF;
       IF NEW.loc_distri IS NULL THEN RAISE EXCEPTION 'loc_distri es obligatorio %', NEW.exp_id USING ERRCODE = '99001'; END IF;
       IF NEW.loc_posto IS NULL THEN RAISE EXCEPTION 'loc_posto es obligatorio %', NEW.exp_id USING ERRCODE = '99001'; END IF;
       IF NEW.utente IS NULL THEN RAISE EXCEPTION 'utente es obligatorio %', NEW.exp_id USING ERRCODE = '99001'; END IF;
    END IF;

    IF NOT (NEW.exp_id ~ '^\d{3}/ARA(S|N|Z)|DPMAIP/\d{4}/(CL/UF/SL)$') THEN
       RAISE EXCEPTION 'EXP_ID NO TIENE EL FORMATO CORRECTO %', NEW.exp_id USING ERRCODE = '99001';
    END IF;
        RETURN NEW;
END;
$function$

CREATE TRIGGER validate_exploracao BEFORE INSERT OR UPDATE ON utentes.exploracaos FOR EACH ROW EXECUTE PROCEDURE utentes.validate_exploracao()

COMMIT;
