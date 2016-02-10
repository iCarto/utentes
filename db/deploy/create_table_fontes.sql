-- Deploy create_table_fontes
-- requires: create_table_exploracaos

BEGIN;

CREATE TABLE utentes.fontes (
    gid serial PRIMARY KEY,
    exploracao integer NOT NULL REFERENCES utentes.exploracaos(gid)
    	       ON UPDATE CASCADE
	       ON DELETE CASCADE,
    tipo_agua text NOT NULL,
    tipo_fonte text,
    lat_lon text,
    d_dado date,
    c_requerid numeric(10,2),
    c_max numeric(10,2),
    c_real numeric(10,2),
    contador boolean,
    metodo_est text
);

ALTER TABLE utentes.fontes OWNER TO utentes;

COMMIT;
