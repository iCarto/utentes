-- Deploy utentes:create_trigger_calculate_area_exploracao to pg

BEGIN;

CREATE FUNCTION utentes.calcular_area() RETURNS trigger AS $$
    BEGIN
        IF (NEW.the_geom IS NOT NULL) THEN
            NEW.area = ST_Area(NEW.the_geom) / 10000;
        END IF;
    RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

-- ALTER FUNCTION utentes.calcular_area_exp() OWNER TO :"owner";

CREATE TRIGGER calcular_area
    BEFORE INSERT OR UPDATE ON utentes.exploracaos
    FOR EACH ROW
    EXECUTE PROCEDURE utentes.calcular_area();

CREATE TRIGGER calcular_area
    BEFORE INSERT OR UPDATE ON utentes.actividades_cultivos
    FOR EACH ROW
    EXECUTE PROCEDURE utentes.calcular_area();

UPDATE utentes.exploracaos SET the_geom = the_geom;
UPDATE utentes.actividades_cultivos SET the_geom = the_geom;

COMMIT;
