-- Deploy create_table_licencias
-- requires: create_table_exploracaos

BEGIN;

CREATE TABLE utentes.licencias (
    gid serial PRIMARY KEY,
    lic_nro text NOT NULL UNIQUE,
    lic_tipo text NOT NULL,
    exploracao integer NOT NULL REFERENCES utentes.exploracaos(gid)
    	       ON UPDATE CASCADE
	       ON DELETE CASCADE,
    cadastro text,
    d_emissao date,
    d_validade date,
    d_solici date,
    estado text,
    c_requerid numeric(10,2),
    c_licencia numeric(10,2),
    c_real numeric(10,2),
    c_real_int numeric(10,2)
);

ALTER TABLE utentes.licencias OWNER TO utentes;

COMMIT;
