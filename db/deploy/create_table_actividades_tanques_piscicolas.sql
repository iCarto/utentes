-- Deploy utentes:create_table_actividade_tanques_piscicolas to pg

BEGIN;

CREATE TABLE utentes.actividades_tanques_piscicolas (

    gid SERIAL PRIMARY KEY,
    tanque_id text NOT NULL UNIQUE,
    actividade integer NOT NULL REFERENCES utentes.actividades_piscicultura(gid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    tipo text NOT NULL references domains.tanque_piscicola_tipo(key) on update cascade on delete no action,
    cumprimen numeric(10,2),
    largura numeric(10,2),
    profundid numeric(10,2),
    area numeric(12,4),
    area_gps numeric(12,4),
    volume numeric(12,4),
    estado text REFERENCES domains.tanque_piscicola_estado(key)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    esp_culti text NOT NULL REFERENCES domains.tanque_piscicola_esp_culti(key)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    esp_cul_o TEXT,
    tipo_alim TEXT[],
    tipo_al_o TEXT,
    n_ale_pov integer,
    prov_alev text references domains.tanque_piscicola_prov_alev(key) on update cascade on delete no action,
    prov_al_o text,
    venda numeric(10,2),
    consumo numeric(10,2),
    pro_anual numeric(10,2),
    peso_med numeric(10,2),
    fert_agua text references domains.tanque_piscicola_fert_agua(key) on update cascade on delete no action,
    fert_a_o text,
    observacio text,
    the_geom geometry(MultiPolygon,32737)
);
CREATE INDEX ON utentes.actividades_tanques_piscicolas USING GIST (the_geom);
-- ALTER TABLE utentes.actividades_tanques_piscicolas OWNER TO utentes;


CREATE FUNCTION utentes.calcular_area_m2() RETURNS trigger AS $$
BEGIN
    NEW.area_gps = ST_Area(NEW.the_geom);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ALTER FUNCTION utentes.calcular_area_m2() OWNER TO :"owner";

CREATE TRIGGER calcular_area_m2
BEFORE INSERT OR UPDATE ON utentes.actividades_tanques_piscicolas
FOR EACH ROW EXECUTE PROCEDURE utentes.calcular_area_m2();

UPDATE utentes.actividades_tanques_piscicolas SET the_geom = the_geom;

COMMIT;
