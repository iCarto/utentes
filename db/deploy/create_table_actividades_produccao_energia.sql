-- Deploy create_table_actividades_produccao_energia
-- requires: create_schema_utentes
-- requires: create_table_actividades

BEGIN;

CREATE TABLE utentes.actividades_produccao_energia (
    gid integer PRIMARY KEY REFERENCES utentes.actividades(gid)
         ON UPDATE CASCADE
         ON DELETE CASCADE,
    c_estimado numeric(10,2),
    energia_tipo text REFERENCES domains.energia_tipo(key)
         ON UPDATE CASCADE
	 ON DELETE NO ACTION,
    alt_agua numeric(10,2),
    potencia numeric(10,2),
    equipo text,
    eval_impac boolean
);

ALTER TABLE utentes.actividades_produccao_energia OWNER TO utentes;

COMMIT;
