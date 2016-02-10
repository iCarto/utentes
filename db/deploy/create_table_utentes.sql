-- Deploy create_table_utentes
-- requires: create_schema_utentes

BEGIN;

CREATE TABLE utentes.utentes (
    gid serial PRIMARY KEY,
    nome text NOT NULL UNIQUE,
    nuit text UNIQUE,
    entidade text,
    reg_comerc text,
    reg_zona text
);

ALTER TABLE utentes.utentes OWNER TO utentes;

COMMIT;
