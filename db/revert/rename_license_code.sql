-- Revert utentes:rename_license_code from pg

BEGIN;

DROP FUNCTION utentes.code_for_state;

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

    IF NOT (NEW.exp_id ~ '^\d{3}/ARA(S|N|Z)|DPMAIP/\d{4}$') THEN
       RAISE EXCEPTION 'EXP_ID NO TIENE EL FORMATO CORRECTO %', NEW.exp_id USING ERRCODE = '99001';
    END IF;
        RETURN NEW;
END;
$function$;


UPDATE utentes.exploracaos SET
       exp_id = substring(exp_id, 1, 13)
WHERE length(exp_id) = 16;


CREATE OR REPLACE FUNCTION utentes.validate_licencia()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    IF NOT (NEW.lic_nro ~ '^\d{3}/ARA(S|N|Z)|DPMAIP/\d{4}/(Sub|Sup)$') THEN
       RAISE EXCEPTION 'LIC_NRO NO TIENE EL FORMATO CORRECTO %', NEW.lic_nro USING ERRCODE = '99001';
    END IF;
        RETURN NEW;
END;
$function$;

UPDATE utentes.licencias SET
       lic_nro = substring(lic_nro, 1, 13) || substring(lic_nro, 17, 4)
WHERE length(lic_nro) = 20;


UPDATE utentes.actividades_cultivos c SET
       cult_id = substring(cult_id, 1, 13) || substring(cult_id, 17, 4)
WHERE length(cult_id) = 20;

UPDATE utentes.actividades_tanques_piscicolas c SET
       tanque_id = substring(tanque_id, 1, 13) || substring(tanque_id, 17, 4)
WHERE length(tanque_id) = 20;

delete from domains.licencia_estado where key = 'Utente de usos comuns';
refresh materialized view domains.domains;

alter table utentes.exploracaos drop column exp_id_historic;
COMMIT;
