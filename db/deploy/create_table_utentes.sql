-- Deploy create_table_utentes
-- requires: create_schema_utentes

BEGIN;

CREATE TABLE utentes.utentes (
    gid        serial PRIMARY KEY,
    nome       text NOT NULL UNIQUE,
    nuit       text,
    entidade   text,
    reg_comerc text,
    reg_zona   text,
    loc_provin text,
    loc_distri text,
    loc_posto  text,
    loc_nucleo text
);

ALTER TABLE utentes.utentes OWNER TO utentes;

COMMIT;
