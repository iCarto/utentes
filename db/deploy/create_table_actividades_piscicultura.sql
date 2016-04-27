-- Deploy create_table_actividades_piscicultura
-- requires: create_schema_utentes
-- requires: create_table_actividades

BEGIN;

CREATE TABLE utentes.actividades_piscicultura (
    gid integer PRIMARY KEY REFERENCES utentes.actividades(gid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    c_estimado numeric(10,2),
    area numeric(12,4),
    v_reservas numeric(10,2)
);

ALTER TABLE utentes.actividades_piscicultura OWNER TO utentes;

COMMIT;
