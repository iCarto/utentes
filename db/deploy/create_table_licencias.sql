-- Deploy create_table_licencias
-- requires: create_table_exploracaos

BEGIN;

CREATE TABLE utentes.licencias (
    gid        serial PRIMARY KEY,
    lic_nro    text NOT NULL UNIQUE,
    lic_tipo   text NOT NULL,
    finalidade text,
    cadastro   text,
    estado     text,
    d_emissao  date,
    d_validade date,
    c_soli_tot numeric(10,2),
    c_soli_int numeric(10,2),
    c_soli_fon numeric(10,2),
    c_licencia numeric(10,2),
    c_real_tot numeric(10,2),
    c_real_int numeric(10,2),
    c_real_fon numeric(10,2),
    exploracao integer NOT NULL
               REFERENCES utentes.exploracaos(gid)
    	         ON UPDATE CASCADE
	             ON DELETE CASCADE
);

ALTER TABLE utentes.licencias OWNER TO utentes;

COMMIT;
