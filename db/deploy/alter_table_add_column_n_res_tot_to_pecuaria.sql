-- Deploy utentes:alter_table_add_column_n_res_tot_to_pecuaria to pg

BEGIN;

ALTER TABLE utentes.actividades_pecuaria ADD COLUMN n_res_tot integer;
UPDATE utentes.actividades_pecuaria a SET n_res_tot = (SELECT sum(reses_nro) FROM utentes.actividades_reses c WHERE c.actividade = a.gid);

COMMIT;
