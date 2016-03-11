-- Deploy create_table_actividades_industria
-- requires: create_schema_utentes
-- requires: create_table_actividades

BEGIN;

CREATE TABLE utentes.actividades_industria (
    gid integer PRIMARY KEY REFERENCES utentes.actividades(gid)
         ON UPDATE CASCADE
         ON DELETE CASCADE,
    exploracao integer NOT NULL,
    c_estimado numeric(10,2),
    tipo text,
    instalacio text,
    efluente text,
    tratamento text,
    eval_impac boolean
);

ALTER TABLE utentes.actividades_industria OWNER TO utentes;

COMMIT;
