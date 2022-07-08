-- Verify utentes:alter_table_agricultura_add_new_fields on pg

BEGIN;

SELECT n_cul_tot, area_pot, area_irri, area_medi FROM utentes.actividades_agricultura_rega WHERE false;

ROLLBACK;
