-- Deploy create_table_actividades_abastecemento
-- requires: create_schema_utentes
-- requires: create_table_actividades

BEGIN;

CREATE TABLE utentes.actividades_abastecemento (
    gid serial NOT NULL PRIMARY KEY,
    exploracao integer NOT NULL,
    c_estimado numeric(10,2) NOT NULL,
    habitantes integer NOT NULL DEFAULT 20,
    dotacao integer NOT NULL
);

ALTER TABLE utentes.actividades_abastecemento OWNER TO utentes;

COMMIT;
