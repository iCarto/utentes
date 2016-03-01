-- Deploy create_table_exploracaos
-- requires: create_table_utentes

BEGIN;

CREATE TABLE utentes.exploracaos (
    gid        serial PRIMARY KEY,
    exp_id     text NOT NULL UNIQUE,
    exp_name   text NOT NULL,
    d_soli     date,
    observacio text,
    loc_provin text NOT NULL,
    loc_distri text NOT NULL,
    loc_posto  text NOT NULL,
    loc_nucleo text,
    loc_endere text,
    loc_bacia  text,
    loc_subaci text,
    loc_rio    text,
    pagos      boolean,
    c_soli     numeric(10,2),
    c_licencia numeric(10,2),
    c_real     numeric(10,2),
    c_estimado numeric(10,2),
    actividade text,
    area       numeric(10,2),
    the_geom   geometry(MultiPolygon,32737),
    utente     integer NOT NULL
               REFERENCES utentes.utentes(gid)
               ON UPDATE CASCADE
               ON DELETE CASCADE
);

CREATE INDEX ON utentes.exploracaos USING GIST (the_geom);
ALTER TABLE utentes.exploracaos OWNER TO utentes;

COMMIT;
