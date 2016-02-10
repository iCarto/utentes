-- Deploy create_table_exploracaos
-- requires: create_table_utentes

BEGIN;

CREATE TABLE utentes.exploracaos (
    gid serial PRIMARY KEY,
    exp_name text NOT NULL UNIQUE,
    exp_id text NOT NULL UNIQUE,
    utente integer NOT NULL REFERENCES utentes.utentes(gid)
    	   ON UPDATE CASCADE
	   ON DELETE CASCADE,
    observacio text,
    loc_provin text NOT NULL,
    loc_distri text NOT NULL,
    loc_posto text NOT NULL,
    loc_nucleo text,
    loc_endere text,
    loc_bacia text,
    loc_rio text,
    pagos boolean NOT NULL,
    c_requerid numeric(10,2),
    c_licencia numeric(10,2),
    c_real numeric(10,2),
    c_estimado numeric(10,2),
    the_geom geometry(MultiPolygon,32737)
);

CREATE INDEX ON utentes.exploracaos USING GIST (the_geom);
ALTER TABLE utentes.exploracaos OWNER TO utentes;

COMMIT;
