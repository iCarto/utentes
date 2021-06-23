-- Deploy utentes:aras_unification to pg

BEGIN;


-- Update exp_id serial part of the code for ARAN and ARAZ
UPDATE utentes.exploracaos SET exp_id = overlay(exp_id placing '1' from 1 for 1) where exp_id ~ 'ARAN';
-- By hand based on actual values of ARACN
UPDATE utentes.exploracaos SET exp_id = '004/ARAN/2021/CL' WHERE exp_id = '101/ARAN/2021/CL';
UPDATE utentes.exploracaos SET exp_id = '005/ARAN/2021/CL' WHERE exp_id = '102/ARAN/2021/CL';

UPDATE utentes.exploracaos SET exp_id = overlay(exp_id placing '1' from 1 for 1) where exp_id ~ 'ARAZ' AND estado_lic != 'Utente de usos comuns';
-- By hand based on actual values of ARAC for 2021 to avoid using big serial for this year
-- There are not licenses for 2021 in ARAZ

-- Register the old code for those that change
UPDATE utentes.licencias SET n_licen_a = COALESCE(n_licen_a || ', ' || lic_nro, lic_nro) where lic_nro ~ 'ARAN';
UPDATE utentes.licencias SET n_licen_a = COALESCE(n_licen_a || ', ' || lic_nro, lic_nro) where lic_nro ~ 'ARAZ' and estado != 'Utente de usos comuns';

-- exp_id is not filled for ARAN, and in ARAS the only change is '-IP' so this query is good enougth
UPDATE inventario.fontes SET exp_id = replace(exp_id, 'ARAS', 'ARAS-IP');


CREATE FUNCTION array_distinct(anyarray) RETURNS anyarray AS $f$
  SELECT array_agg(DISTINCT x) FROM unnest($1) t(x);
$f$ LANGUAGE SQL IMMUTABLE;

ALTER TABLE inventario_dominios.unidade ALTER COLUMN app TYPE text[] USING string_to_array(app, ',');

-- Removes DPMAIP from the database

-- select 'UPDATE ' || table_schema || '.' || table_name || ' SET app = array_remove(app, ''DPMAIP'') ;' from information_schema.columns where column_name IN ('ara', 'app') and table_schema IN ('domains', 'inventario_dominios');
UPDATE domains.bacia SET app = array_remove(app, 'DPMAIP') ;
UPDATE domains.distrito SET app = array_remove(app, 'DPMAIP') ;
UPDATE domains.facturacao_consumo_tipo SET app = array_remove(app, 'DPMAIP') ;
UPDATE domains.facturacao_fact_tipo SET app = array_remove(app, 'DPMAIP') ;
UPDATE domains.licencia_estado SET app = array_remove(app, 'DPMAIP') ;
UPDATE domains.licencia_estado_renovacao SET app = array_remove(app, 'DPMAIP') ;
UPDATE domains.licencia_tipo_lic SET app = array_remove(app, 'DPMAIP') ;
UPDATE domains.posto SET app = array_remove(app, 'DPMAIP') ;
UPDATE domains.provincia SET app = array_remove(app, 'DPMAIP') ;
UPDATE domains.subacia SET app = array_remove(app, 'DPMAIP') ;
UPDATE domains.unidade SET app = array_remove(app, 'DPMAIP') ;
UPDATE domains.facturacao_fact_estado SET app = array_remove(app, 'DPMAIP') ;
UPDATE inventario_dominios.bacia SET app = array_remove(app, 'DPMAIP') ;
UPDATE inventario_dominios.distrito SET app = array_remove(app, 'DPMAIP') ;
UPDATE inventario_dominios.posto SET app = array_remove(app, 'DPMAIP') ;
UPDATE inventario_dominios.provincia SET app = array_remove(app, 'DPMAIP') ;
UPDATE inventario_dominios.subacia SET app = array_remove(app, 'DPMAIP') ;
UPDATE inventario_dominios.unidade SET app = array_remove(app, 'DPMAIP') ;
DELETE FROM domains.licencia_estado WHERE key = 'Desconhecido';


-- Updates actual 'app' columns to match new names:
-- Norte -> Norte
-- Centro-Norte -> Norte
-- Centro -> Centro
-- Sul -> Sul
-- Zambeze -> Centro

UPDATE domains.bacia SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE domains.bacia SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE domains.distrito SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE domains.distrito SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE domains.facturacao_consumo_tipo SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE domains.facturacao_consumo_tipo SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE domains.facturacao_fact_tipo SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE domains.facturacao_fact_tipo SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE domains.licencia_estado SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE domains.licencia_estado SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE domains.licencia_estado_renovacao SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE domains.licencia_estado_renovacao SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE domains.licencia_tipo_lic SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE domains.licencia_tipo_lic SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE domains.posto SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE domains.posto SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE domains.provincia SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE domains.provincia SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE domains.subacia SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE domains.subacia SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE domains.unidade SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE domains.unidade SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE domains.facturacao_fact_estado SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE domains.facturacao_fact_estado SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE inventario_dominios.bacia SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE inventario_dominios.bacia SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE inventario_dominios.distrito SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE inventario_dominios.distrito SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE inventario_dominios.posto SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE inventario_dominios.posto SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE inventario_dominios.provincia SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE inventario_dominios.provincia SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE inventario_dominios.subacia SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE inventario_dominios.subacia SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));

UPDATE inventario_dominios.unidade SET app = array_distinct(array_replace(app, 'Centro-Norte', 'Norte'));
UPDATE inventario_dominios.unidade SET app = array_distinct(array_replace(app, 'Zambeze', 'Norte'));






UPDATE domains.ara SET
    key = 'Norte'
    , value = 'ARAN'
    , tooltip = 'ARA-Norte, IP'
WHERE
    key IN ('Norte', 'Centro-Norte')
;


UPDATE domains.ara SET
    -- Discriminador que se usa a nivel de vista domains.domains y en la columna "app" de los dominios
    -- Podría tener sentido usar directamente 'ARAS' o 'ARA-Sul, IP', en lugar de 'Sul'. Se deja porqué
    -- resulta más sencillo para inspecciones visuales
    key = 'Sul'
    -- Se usa en algunos puntos como los triggers para validar los códigos, añandiendo el '-IP'
    , value = 'ARAS'
    -- Apenas se usa, sólo en la parte de procesado de datos no a nivel app
    , tooltip = 'ARA-Sul, IP'
WHERE
    key IN ('Sul')
;


UPDATE domains.ara SET
    key = 'Centro'
    , value = 'ARAC'
    , tooltip = 'ARA-Centro, IP'
WHERE
    key IN ('Centro', 'Zambeze')
;



REFRESH MATERIALIZED VIEW domains.domains;



DROP FUNCTION array_distinct(anyarray);



-- Update triggers to validate the new format of the codes
CREATE OR REPLACE FUNCTION utentes.validate_licencia()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

DECLARE
    ara text;
    regexp text;
BEGIN
    ara := (SELECT value FROM domains.ara);
    regexp := '^\d{3}/' || ara || '-IP/\d{4}/(CL|UF|SL)/(Sub|Sup)$';

    IF NOT (NEW.lic_nro ~ regexp) THEN
       RAISE EXCEPTION 'LIC_NRO NO TIENE EL FORMATO CORRECTO %', NEW.lic_nro USING ERRCODE = '99001';
    END IF;
        RETURN NEW;
END;
$function$
;



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

    regexp := '^\d{3}/' || NEW.ara || '-IP/\d{4}' || code || '$';
    IF NOT (NEW.exp_id ~ regexp) THEN
       RAISE EXCEPTION 'EXP_ID NO TIENE EL FORMATO CORRECTO %', NEW.exp_id USING ERRCODE = '99001';
    END IF;
        RETURN NEW;
END;
$function$
;



-- Update codes: exp_id, lic_nro, cult_id, tangue_id
UPDATE utentes.exploracaos SET exp_id = left(exp_id, 4) || (SELECT value FROM domains.ara LIMIT 1) || '-IP' || right(exp_id, 8);
UPDATE utentes.licencias l SET lic_nro = e.exp_id || '/' || left(tipo_agua, 3) FROM utentes.exploracaos e WHERE l.exploracao = e.gid;
WITH foo AS ( SELECT e.exp_id, a.gid as actividade FROM utentes.exploracaos e JOIN utentes.actividades a ON e.gid = a.exploracao) UPDATE utentes.actividades_cultivos c SET cult_id = foo.exp_id || right(c.cult_id, 4) FROM foo WHERE c.actividade = foo.actividade;
WITH foo AS ( SELECT e.exp_id, a.gid as actividade FROM utentes.exploracaos e JOIN utentes.actividades a ON e.gid = a.exploracao) UPDATE utentes.actividades_tanques_piscicolas c SET tanque_id = foo.exp_id || right(c.tanque_id, 4) FROM foo WHERE c.actividade = foo.actividade;



UPDATE utentes.exploracaos SET ara = (SELECT value FROM domains.ara LIMIT 1);


UPDATE cbase.unidades_weap SET ara = 'ARA-Sul, IP' WHERE ara = 'ARA Sul';
UPDATE cbase_ara.unidades_weap SET ara = 'ARA-Sul, IP' WHERE ara = 'ARA Sul';


DROP TABLE utentes.settings;

COMMIT;
