-- Revert utentes:add_ara_centro_and_centronorte from pg

BEGIN;

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

UPDATE domains.licencia_estado SET app = '{Norte,Sul,Zambeze}' WHERE app = '{Norte,Sul,Zambeze,Centro,Centro-Norte}';

ALTER TABLE domains.ara ALTER COLUMN category DROP NOT NULL;
ALTER TABLE domains.ara ALTER COLUMN category DROP DEFAULT;

COMMIT;
