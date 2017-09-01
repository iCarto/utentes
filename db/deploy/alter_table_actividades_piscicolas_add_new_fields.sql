-- Deploy utentes:alter_table_actividades_piscicolas_add_new_fields to pg

BEGIN;

CREATE TABLE domains.piscicultura_tipo_proc (
    category text DEFAULT 'piscicultura_tipo_proc',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
-- ALTER TABLE domains. OWNER TO ...
INSERT INTO domains.piscicultura_tipo_proc (key, ordering) VALUES
(NULL, 0),
('Geado', 1),
('Frito', 2),
('Fumado', 3),
('Seco', 4),
('Vivo', 5);


CREATE TABLE domains.piscicultura_gaio_subm (
    category text DEFAULT 'piscicultura_subm',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
-- ALTER TABLE domains. OWNER TO ...
INSERT INTO domains.piscicultura_gaio_subm (key, ordering) VALUES
(NULL, 0),
('Albufeira', 1),
('Lago', 2),
('Nascente', 3),
('Río', 4);


CREATE OR REPLACE VIEW domains.domains AS
SELECT category, key, value, ordering, parent, tooltip FROM domains.ara
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.actividade
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.animal_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.bacia
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.contador
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.cultivo_tipo
UNION
SELECT a.category, a.key, a.value, a.ordering, a.parent, a.tooltip FROM domains.distrito a JOIN domains.ara b on a.ara = b.key
UNION
SELECT 'utentes-distrito', key, value, ordering, parent, tooltip FROM domains.distrito
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.energia_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.fonte_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.industria_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.licencia_estado
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.licencia_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.pagamentos
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.boolean
UNION
SELECT a.category, a.key, a.value, a.ordering, a.parent, a.tooltip FROM domains.posto a JOIN domains.ara b on a.ara = b.key
UNION
SELECT 'utentes-posto', key, value, ordering, parent, tooltip FROM domains.posto
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.provincia
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.rega_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.subacia
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.piscicultura_tipo_proc
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.piscicultura_gaio_subm
-- UNION
-- SELECT category, key, value, ordering, parent, tooltip FROM domains.tanque_piscicola_tipo
-- UNION
-- SELECT category, key, value, ordering, parent, tooltip FROM domains.tanque_piscicola_estado
-- UNION
-- SELECT category, key, value, ordering, parent, tooltip FROM domains.tanque_piscicola_esp_culti
-- UNION
-- SELECT category, key, value, ordering, parent, tooltip FROM domains.tanque_piscicola_tipo_alim
-- UNION
-- SELECT category, key, value, ordering, parent, tooltip FROM domains.tanque_piscicola_prov_alev
-- UNION
-- SELECT category, key, value, ordering, parent, tooltip FROM domains.tanque_piscicola_fert_agua
;




ALTER TABLE utentes.actividades_piscicultura
    ADD COLUMN produc_pi NUMERIC(10,2),
    ADD COLUMN n_tanques INTEGER,
    ADD COLUMN n_ale_pov INTEGER,
    ADD COLUMN ano_i_ati INTEGER,
    ADD COLUMN tipo_proc TEXT REFERENCES domains.piscicultura_tipo_proc(key) ON UPDATE CASCADE ON DELETE NO ACTION,
    ADD COLUMN asis_aber TEXT REFERENCES domains.boolean(key) ON UPDATE CASCADE ON DELETE NO ACTION,
    ADD COLUMN asis_moni TEXT REFERENCES domains.boolean(key) ON UPDATE CASCADE ON DELETE NO ACTION,
    ADD COLUMN asis_orig TEXT[],
    ADD COLUMN asis_or_o TEXT,
    ADD COLUMN trat_t_en TEXT REFERENCES domains.boolean(key) ON UPDATE CASCADE ON DELETE NO ACTION,
    ADD COLUMN trat_a_sa TEXT REFERENCES domains.boolean(key) ON UPDATE CASCADE ON DELETE NO ACTION,
    ADD COLUMN gaio_subm TEXT REFERENCES domains.piscicultura_gaio_subm(key) ON UPDATE CASCADE ON DELETE NO ACTION,
    ADD COLUMN problemas TEXT REFERENCES domains.boolean(key) ON UPDATE CASCADE ON DELETE NO ACTION,
    ADD COLUMN prob_prin TEXT;


CREATE OR REPLACE FUNCTION utentes.calcular_area_piscicola() RETURNS trigger
    LANGUAGE plpgsql AS $function$
    DECLARE
        my_gid integer := null;
    BEGIN
        SELECT gid FROM utentes.actividades WHERE exploracao = NEW.gid AND tipo = 'Piscicultura' INTO my_gid;
        IF (NEW.the_geom IS NOT NULL) AND (my_gid IS NOT NULL) THEN
            UPDATE utentes.actividades_piscicultura SET area = ST_Area(NEW.the_geom) / 10000 WHERE gid = my_gid;
        END IF;
        RETURN NEW;
     END;
$function$;


CREATE TRIGGER calcular_area_piscicola
    AFTER INSERT OR UPDATE ON utentes.exploracaos
    FOR EACH ROW
    EXECUTE PROCEDURE utentes.calcular_area_piscicola();

COMMIT;
