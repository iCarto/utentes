-- Verify utentes:alter_table_actividades_piscicolas_add_new_fields on pg

BEGIN;

SELECT * FROM domains.piscicultura_tipo_proc where false;
SELECT * FROM domains.piscicultura_gaio_subm where false;
SELECT produc_pi, n_tanques, n_ale_pov, ano_i_ati, tipo_proc, asis_aber, asis_moni, asis_orig, asis_or_o, trat_t_en, trat_a_sa, gaio_subm, problemas, prob_prin
FROM utentes.actividades_piscicultura WHERE FALSE;

ROLLBACK;
