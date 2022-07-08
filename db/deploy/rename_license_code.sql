-- Deploy utentes:rename_license_code to pg

BEGIN;

CREATE OR REPLACE FUNCTION utentes.code_for_state(state text, separator text DEFAULT '/') RETURNS text AS $$
DECLARE
    result text;
BEGIN
    result :=
        CASE state
             WHEN 'Utente de facto' THEN 'UF'
             WHEN 'Utente de usos comuns' THEN 'SL'
             ELSE 'CL'
        END;
    RETURN separator || result;
END;
$$ LANGUAGE plpgsql;
ALTER FUNCTION utentes.code_for_state OWNER TO :owner;
GRANT ALL ON FUNCTION utentes.code_for_state TO :owner;
REVOKE ALL ON FUNCTION utentes.code_for_state FROM PUBLIC;
GRANT EXECUTE ON FUNCTION utentes.code_for_state TO :base_user;


-- Lanzar una excepción en el deploy no es lo más apropiado, pero aquí lo hago
-- de forma consciente. Prefiero saltar pronto en este caso que esperar a
-- un verify-revert
DO $$
BEGIN
    PERFORM true
    FROM utentes.exploracaos e JOIN utentes.licencias l ON e.gid = l.exploracao
    WHERE (e.estado_lic = 'Utente de facto' OR l.estado = 'Utente de facto') AND e.estado_lic != l.estado;

    IF FOUND THEN
        RAISE EXCEPTION 'Hay explotaciones sin un código de 16 caracteres';
    END IF;
END;
$$;


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
$function$;


UPDATE utentes.exploracaos SET
       exp_id = exp_id || utentes.code_for_state(estado_lic)
WHERE length(exp_id) = 13;


CREATE OR REPLACE FUNCTION utentes.validate_licencia()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    IF NOT (NEW.lic_nro ~ '^\d{3}/ARA(S|N|Z)|DPMAIP/\d{4}/(CL/UF/SL)/(Sub|Sup)$') THEN
       RAISE EXCEPTION 'LIC_NRO NO TIENE EL FORMATO CORRECTO %', NEW.lic_nro USING ERRCODE = '99001';
    END IF;
        RETURN NEW;
END;
$function$;

UPDATE utentes.licencias SET
       lic_nro = substring(lic_nro, 1, 13) || utentes.code_for_state(estado) || substring(lic_nro, 14, 5)
WHERE length(lic_nro) = 17;


UPDATE utentes.actividades_cultivos c SET
       cult_id =
               substring(cult_id, 1, 13)
               || utentes.code_for_state
                  (
                    (select e.estado_lic from utentes.exploracaos e join utentes.actividades a on e.gid = a.exploracao where a.gid = c.actividade)
                  )
               || substring(cult_id, 14, 4)
WHERE length(cult_id) = 17;

UPDATE utentes.actividades_tanques_piscicolas c SET
       tanque_id =
               substring(tanque_id, 1, 13)
               || utentes.code_for_state
                  (
                    (select e.estado_lic from utentes.exploracaos e join utentes.actividades a on e.gid = a.exploracao where a.gid = c.actividade)
                  )
               || substring(tanque_id, 14, 4)
WHERE length(tanque_id) = 17;

INSERT INTO domains.licencia_estado (key, ordering, parent, tooltip, app)
VALUES
('Utente de usos comuns', 14, 'post-licenciada', 'Utente de usos comuns', '{Norte,Sul,Zambeze}');

REFRESH MATERIALIZED VIEW domains.domains;

alter table utentes.exploracaos add column exp_id_historic text[];
COMMIT;
