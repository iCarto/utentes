-- Deploy create_table_actividades_industria
-- requires: create_schema_utentes
-- requires: create_table_actividades

BEGIN;

CREATE TABLE utentes.actividades_industria (
    gid integer PRIMARY KEY REFERENCES utentes.actividades(gid)
         ON UPDATE CASCADE
         ON DELETE CASCADE,
    c_estimado numeric(10,2),
    tipo_indus text REFERENCES domains.industria_tipo(key)
          ON UPDATE CASCADE
	        ON DELETE NO ACTION,
    instalacio text,
    efluente text,
    tratamento text,
    eval_impac boolean
);

ALTER TABLE utentes.actividades_industria OWNER TO utentes;

COMMIT;
