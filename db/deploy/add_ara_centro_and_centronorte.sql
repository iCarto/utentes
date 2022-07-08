-- Deploy utentes:add_ara_centro_and_centronorte to pg

BEGIN;

CREATE OR REPLACE FUNCTION utentes.validate_licencia()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    IF NOT (NEW.lic_nro ~ '^\d{3}/ARA(S|N|Z|C|CN)|DPMAIP/\d{4}/(CL/UF/SL)/(Sub|Sup)$') THEN
       RAISE EXCEPTION 'LIC_NRO NO TIENE EL FORMATO CORRECTO %', NEW.lic_nro USING ERRCODE = '99001';
    END IF;
        RETURN NEW;
END;
$function$;

UPDATE domains.licencia_estado SET app = '{Norte,Sul,Zambeze,Centro,Centro-Norte}' WHERE app = '{Norte,Sul,Zambeze}';

ALTER TABLE domains.ara ALTER COLUMN category SET DEFAULT 'ara';
UPDATE domains.ara SET category = 'ara';
ALTER TABLE domains.ara ALTER COLUMN category SET NOT NULL;

COMMIT;
