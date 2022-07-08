-- Deploy utentes:modify_ara_domain_and_code_validations to pg

BEGIN;

DROP TRIGGER validate_exploracao ON utentes.exploracaos;
DROP FUNCTION utentes.validate_exploracao();

UPDATE domains.ara SET value = 'ARAZ' WHERE value = 'Zambeze';
UPDATE domains.ara SET value = 'ARAS' WHERE value = 'Sul';
UPDATE domains.ara SET value = 'ARAN' WHERE value = 'Norte';

CREATE OR REPLACE FUNCTION utentes.before_exploracao()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE

    regexp text;
    code text;
BEGIN

    NEW.ara := (SELECT value FROM domains.ara);

    IF NEW.estado_lic IN (
        'Irregular'
        , 'Licenciada'
        , 'Pendente Parecer Técnico (R. Cad DT)'
        , 'Pendente Emisão Licença (D. Jur)'
        , 'Pendente Firma Licença (Direcção)'
        , 'Utente de facto'
    ) THEN
       IF NEW.loc_provin IS NULL THEN
          RAISE EXCEPTION 'loc_provin es obligatorio %', NEW.exp_id USING ERRCODE = '99001';
       END IF;
       IF NEW.loc_distri IS NULL THEN
          RAISE EXCEPTION 'loc_distri es obligatorio %', NEW.exp_id USING ERRCODE = '99001';
       END IF;
       IF NEW.loc_posto IS NULL THEN
          RAISE EXCEPTION 'loc_posto es obligatorio %', NEW.exp_id USING ERRCODE = '99001';
       END IF;
       IF NEW.utente IS NULL THEN
          RAISE EXCEPTION 'utente es obligatorio %', NEW.exp_id USING ERRCODE = '99001';
       END IF;
    END IF;

    code := utentes.code_for_state(NEW.estado_lic);

    regexp := '^\d{3}/' || NEW.ara || '/\d{4}' || code || '$';
    IF NOT (NEW.exp_id ~ regexp) THEN
       RAISE EXCEPTION 'EXP_ID NO TIENE EL FORMATO CORRECTO %', NEW.exp_id USING ERRCODE = '99001';
    END IF;
        RETURN NEW;
END;
$function$;

CREATE TRIGGER before_exploracao BEFORE INSERT OR UPDATE ON utentes.exploracaos FOR EACH ROW EXECUTE PROCEDURE utentes.before_exploracao();

COMMIT;
