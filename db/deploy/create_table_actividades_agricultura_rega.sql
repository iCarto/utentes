-- Deploy create_table_actividades_agricultura_rega
-- requires: create_schema_utentes
-- requires: create_table_actividades

BEGIN;

CREATE TABLE utentes.actividades_agricultura_rega (
    gid serial NOT NULL PRIMARY KEY,
    exploracao integer NOT NULL,
    c_estimado numeric(10,2) NOT NULL
);

ALTER TABLE utentes.actividades_agricultura_rega OWNER TO utentes;

COMMIT;
