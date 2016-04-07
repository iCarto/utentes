-- Deploy create_table_actividades_reses
-- requires: create_schema_utentes
-- requires: create_table_actividades
-- requires: create_table_actividades_pecuaria

BEGIN;

CREATE TABLE utentes.actividades_reses (

    gid SERIAL PRIMARY KEY,
    actividade integer NOT NULL REFERENCES utentes.actividades_pecuaria(gid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    c_estimado numeric(10,2) NOT NULL,
    reses_tipo text NOT NULL REFERENCES domains.animal_tipo(key)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    reses_nro integer NOT NULL,
    c_res integer NOT NULL,
    observacio text
);

ALTER TABLE utentes.actividades_reses OWNER TO utentes;

COMMIT;
