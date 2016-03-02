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
    loc_provin text REFERENCES domains.provincia (key)
               ON UPDATE CASCADE
               ON DELETE NO ACTION,
    loc_distri text,
    loc_posto  text,
    loc_nucleo text,
    observacio text,
    FOREIGN KEY (loc_provin, loc_distri) REFERENCES domains.distrito (parent, key)
                ON UPDATE CASCADE
                ON DELETE NO ACTION,
    FOREIGN KEY (loc_distri, loc_posto) REFERENCES domains.posto (parent, key)
                ON UPDATE CASCADE
                ON DELETE NO ACTION
);

ALTER TABLE utentes.utentes OWNER TO utentes;

COMMIT;
