-- Revert utentes:alter_table_agricultura_add_new_fields from pg

BEGIN;

ALTER TABLE utentes.actividades_agricultura_rega
    DROP COLUMN n_cul_tot,
    DROP COLUMN area_pot,
    DROP COLUMN area_irri,
    DROP COLUMN area_medi
;

COMMIT;
