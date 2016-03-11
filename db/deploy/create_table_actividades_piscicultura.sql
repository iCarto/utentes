-- Deploy create_table_actividades_piscicultura
-- requires: create_schema_utentes
-- requires: create_table_actividades

BEGIN;

CREATE TABLE utentes.actividades_piscicultura (
    gid serial NOT NULL PRIMARY KEY,
    exploracao integer NOT NULL,
    c_estimado numeric(10,2),
    area numeric(10,2),
    v_reservas numeric(10,2)
);

ALTER TABLE utentes.actividades_piscicultura OWNER TO utentes;

COMMIT;
