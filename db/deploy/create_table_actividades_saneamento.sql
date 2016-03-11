-- Deploy create_table_actividades_saneamento
-- requires: create_schema_utentes
-- requires: create_table_actividades

BEGIN;

CREATE TABLE utentes.actividades_saneamento (
    gid integer PRIMARY KEY REFERENCES utentes.actividades(gid)
         ON UPDATE CASCADE
         ON DELETE CASCADE,
    exploracao integer NOT NULL,
    c_estimado numeric(10,2),
    habitantes integer
);

ALTER TABLE utentes.actividades_saneamento OWNER TO utentes;

COMMIT;
