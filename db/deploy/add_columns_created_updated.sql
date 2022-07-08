-- Deploy utentes:add_columns_created_updated to pg

BEGIN;

CREATE OR REPLACE FUNCTION utentes.update_updated_at()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$function$
;


ALTER TABLE utentes.utentes
    ADD COLUMN updated_at timestamp without time zone NOT NULL DEFAULT now()
    , ADD COLUMN created_at timestamp without time zone NOT NULL DEFAULT now()
;

CREATE TRIGGER update_updated_at
    BEFORE UPDATE ON utentes.utentes
    FOR EACH ROW EXECUTE PROCEDURE utentes.update_updated_at();



ALTER TABLE utentes.exploracaos
    ADD COLUMN updated_at timestamp without time zone NOT NULL DEFAULT now()
;

CREATE TRIGGER update_updated_at
    BEFORE UPDATE ON utentes.exploracaos
    FOR EACH ROW EXECUTE PROCEDURE utentes.update_updated_at();


ALTER TABLE utentes.fontes
    ADD COLUMN updated_at timestamp without time zone NOT NULL DEFAULT now()
    , ADD COLUMN created_at timestamp without time zone NOT NULL DEFAULT now()
;

CREATE TRIGGER update_updated_at
    BEFORE UPDATE ON utentes.fontes
    FOR EACH ROW EXECUTE PROCEDURE utentes.update_updated_at();



ALTER TABLE utentes.licencias
    ADD COLUMN updated_at timestamp without time zone NOT NULL DEFAULT now()
    , ADD COLUMN created_at timestamp without time zone NOT NULL DEFAULT now()
;

CREATE TRIGGER update_updated_at
    BEFORE UPDATE ON utentes.licencias
    FOR EACH ROW EXECUTE PROCEDURE utentes.update_updated_at();



ALTER TABLE utentes.renovacoes
    ADD COLUMN updated_at timestamp without time zone NOT NULL DEFAULT now()
    , ADD COLUMN created_at timestamp without time zone NOT NULL DEFAULT now()
;

CREATE TRIGGER update_updated_at
    BEFORE UPDATE ON utentes.renovacoes
    FOR EACH ROW EXECUTE PROCEDURE utentes.update_updated_at();



ALTER TABLE utentes.users
    ADD COLUMN updated_at timestamp without time zone NOT NULL DEFAULT now()
;

CREATE TRIGGER update_updated_at
    BEFORE UPDATE ON utentes.users
    FOR EACH ROW EXECUTE PROCEDURE utentes.update_updated_at();


-- Patch para el ARAN y los cálculos de la línea base
update utentes.exploracaos set req_obs = '[{"text": null, "autor": null, "state": null, "created_at": null}, {"text": null, "autor": null, "state": null, "created_at": null}]'::jsonb where req_obs = 'false';
COMMIT;
