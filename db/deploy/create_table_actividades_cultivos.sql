-- Deploy create_table_actividades_cultivos
-- requires: create_schema_utentes
-- requires: create_table_actividades
-- requires: create_table_actividades_agricultura_rega

BEGIN;

CREATE TABLE utentes.actividades_cultivos (

    gid SERIAL PRIMARY KEY,
    cult_id text NOT NULL UNIQUE,
    actividade integer NOT NULL REFERENCES utentes.actividades_agricultura_rega(gid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    c_estimado numeric(10,2) NOT NULL,
    cultivo text NOT NULL REFERENCES domains.cultivo_tipo(key)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    rega text NOT NULL REFERENCES domains.rega_tipo(key)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    eficiencia numeric(10,2),
    area numeric(10,4),
    observacio text,
    the_geom geometry(MultiPolygon,32737)
);

ALTER TABLE utentes.actividades_cultivos OWNER TO utentes;

COMMIT;
