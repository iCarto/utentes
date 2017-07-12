-- Revert utentes:alter_table_actividades_piscicolas_add_new_fields from pg

BEGIN;

ALTER TABLE utentes.actividades_piscicultura
      DROP COLUMN produc_pi,
      DROP COLUMN n_tanques,
      DROP COLUMN n_ale_pov,
      DROP COLUMN ano_i_ati,
      DROP COLUMN tipo_proc,
      DROP COLUMN asis_aber,
      DROP COLUMN asis_moni,
      DROP COLUMN asis_orig,
      DROP COLUMN asis_or_o,
      DROP COLUMN trat_t_en,
      DROP COLUMN trat_a_sa,
      DROP COLUMN gaio_subm,
      DROP COLUMN problemas,
      DROP COLUMN prob_prin;

CREATE OR REPLACE VIEW domains.domains AS
SELECT category, key, value, ordering, parent, tooltip FROM domains.ara
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.actividade
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.animal_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.bacia
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.contador
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.cultivo_tipo
UNION
SELECT a.category, a.key, a.value, a.ordering, a.parent, a.tooltip FROM domains.distrito a JOIN domains.ara b on a.ara = b.key
UNION
SELECT 'utentes-distrito', key, value, ordering, parent, tooltip FROM domains.distrito
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.energia_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.fonte_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.industria_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.licencia_estado
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.licencia_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.pagamentos
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.boolean
UNION
SELECT a.category, a.key, a.value, a.ordering, a.parent, a.tooltip FROM domains.posto a JOIN domains.ara b on a.ara = b.key
UNION
SELECT 'utentes-posto', key, value, ordering, parent, tooltip FROM domains.posto
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.provincia
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.rega_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.subacia
;

DROP TABLE domains.piscicultura_tipo_proc;
DROP TABLE domains.piscicultura_gaio_subm;

COMMIT;
