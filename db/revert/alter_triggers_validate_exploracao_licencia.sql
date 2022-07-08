-- Revert utentes:alter_triggers_validate_exploracao_licencia from pg

BEGIN;

CREATE OR REPLACE FUNCTION utentes.validate_licencia()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    IF NOT (NEW.lic_nro ~ '^\d{3}/ARA(S|N)/\d{4}/(Sub|Sup)$') THEN
       RAISE EXCEPTION 'LIC_NRO NO TIENE EL FORMATO CORRECTO %', NEW.lic_nro USING ERRCODE = '99001';
    END IF;
        RETURN NEW;
END;
$function$
;

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

    IF NOT (NEW.exp_id ~ '^\d{3}/ARA(S|N)|DPMAIP/\d{4}$') THEN
       RAISE EXCEPTION 'EXP_ID NO TIENE EL FORMATO CORRECTO %', NEW.exp_id USING ERRCODE = '99001';
    END IF;
        RETURN NEW;
END;
$function$
;

COMMIT;
