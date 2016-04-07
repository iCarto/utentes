-- Deploy create_table_actividades_pecuaria
-- requires: create_schema_utentes
-- requires: create_table_actividades

BEGIN;

CREATE TABLE utentes.actividades_pecuaria (
    gid integer PRIMARY KEY REFERENCES utentes.actividades(gid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    c_estimado numeric(10,2)
);

ALTER TABLE utentes.actividades_pecuaria OWNER TO utentes;

COMMIT;
