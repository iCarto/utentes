-- Revert utentes:create_tables_domains_tanques_piscicolas from pg

BEGIN;

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
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.piscicultura_tipo_proc
UNION
SELECT category, key, value, ordering, parent, tooltip FROM domains.piscicultura_gaio_subm
-- UNION
-- SELECT category, key, value, ordering, parent, tooltip FROM domains.tanque_piscicola_tipo
-- UNION
-- SELECT category, key, value, ordering, parent, tooltip FROM domains.tanque_piscicola_estado
-- UNION
-- SELECT category, key, value, ordering, parent, tooltip FROM domains.tanque_piscicola_esp_culti
-- UNION
-- SELECT category, key, value, ordering, parent, tooltip FROM domains.tanque_piscicola_tipo_alim
-- UNION
-- SELECT category, key, value, ordering, parent, tooltip FROM domains.tanque_piscicola_prov_alev
-- UNION
-- SELECT category, key, value, ordering, parent, tooltip FROM domains.tanque_piscicola_fert_agua
;

DROP TABLE domains.tanque_piscicola_tipo;
DROP TABLE domains.tanque_piscicola_estado;
DROP TABLE domains.tanque_piscicola_esp_culti;
DROP TABLE domains.tanque_piscicola_tipo_alim;
DROP TABLE domains.tanque_piscicola_prov_alev;
DROP TABLE domains.tanque_piscicola_fert_agua;

COMMIT;
