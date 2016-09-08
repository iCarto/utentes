-- Deploy sixhiara:create_table_exploracaos to pg

BEGIN;

CREATE TABLE inventario.exploracaos (
       gid SERIAL PRIMARY KEY,
       exp_name text,
       exp_id text,
       d_soli date,
       loc_provin text REFERENCES inventario_dominios.provincia (key)
           ON UPDATE CASCADE
	   ON DELETE NO ACTION,
       loc_distri text,
       loc_post text,
       loc_nucleo text,
       loc_endere text,
       loc_bacia text REFERENCES inventario_dominios.bacia (key)
           ON UPDATE CASCADE
	   ON DELETE NO ACTION,
       loc_subaci text,
       rio text,
       utente text,
       uten_nuit text,
       abastecem boolean,
       saneament boolean,
       agricultu boolean,
       pecuaria boolean,
       piscicult boolean,
       industria boolean,
       pro_energ boolean,
       tipo_subt text,
       tipo_supe text,
       con_l_su numeric(10,2),
       con_l_sb numeric(10,2),
       con_l_to numeric(10,2),
       est_l_su numeric(10,2),
       est_l_sb numeric(10,2),
       pagamento text,
       observacio text,
       geom geometry('MULTIPOLYGON', 32737),
       FOREIGN KEY (loc_provin, loc_distri) REFERENCES inventario_dominios.distrito (parent, key)
           ON UPDATE CASCADE
	   ON DELETE NO ACTION,
       FOREIGN KEY (loc_distri, loc_post) REFERENCES inventario_dominios.posto (parent, key)
       	   ON UPDATE CASCADE
	   ON DELETE NO ACTION
);

-- GRANT SELECT ON inventario.exploracaos TO inventario_read;
-- GRANT INSERT, UPDATE, DELETE ON inventario.exploracaos TO inventario_write;


COMMIT;
