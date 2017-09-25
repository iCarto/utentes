-- Deploy utentes:alter_table_agricultura_add_new_fields to pg

BEGIN;

ALTER TABLE utentes.actividades_agricultura_rega
    ADD COLUMN n_cul_tot integer,
    ADD COLUMN area_pot numeric(12, 4),
    ADD COLUMN area_irri numeric(12, 4),
    ADD COLUMN area_medi numeric(12, 4)
;

UPDATE utentes.actividades_agricultura_rega a SET n_cul_tot = (SELECT count(*) FROM utentes.actividades_cultivos c WHERE c.actividade = a.gid);
UPDATE utentes.actividades_agricultura_rega a SET area_medi = (SELECT sum(area) FROM utentes.actividades_cultivos c WHERE c.actividade = a.gid);

COMMIT;
