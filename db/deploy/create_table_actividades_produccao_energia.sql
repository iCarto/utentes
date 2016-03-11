-- Deploy create_table_actividades_produccao_energia
-- requires: create_schema_utentes
-- requires: create_table_actividades

BEGIN;

CREATE TABLE utentes.actividades_produccao_energia (
    gid serial NOT NULL PRIMARY KEY,
    exploracao integer NOT NULL,
    c_estimado numeric(10,2),
    tipo text,
    alt_agua numeric(10,2),
    potencia numeric(10,2),
    equipo text,
    eval_impac boolean
);

ALTER TABLE utentes.actividades_produccao_energia OWNER TO utentes;

COMMIT;
