-- Deploy create_table_actividades_abastecemento
-- requires: create_schema_utentes
-- requires: create_table_actividades

BEGIN;

CREATE TABLE utentes.actividades_abastecemento (
    gid integer PRIMARY KEY REFERENCES utentes.actividades(gid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    c_estimado numeric(10,2),
    habitantes integer, -- DEFAULT 20,
    dotacao integer
);

-- ALTER TABLE utentes.actividades_abastecemento OWNER TO utentes;

COMMIT;
