-- Deploy create_table_actividades
-- requires: create_schema_utentes

BEGIN;

CREATE TABLE utentes.actividades (
    gid serial PRIMARY KEY,
    exploracao integer NOT NULL	REFERENCES utentes.exploracaos(gid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    tipo text NOT NULL REFERENCES domains.actividade(key)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

ALTER TABLE utentes.actividades OWNER TO utentes;

COMMIT;
