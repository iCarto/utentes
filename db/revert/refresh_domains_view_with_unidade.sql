-- Revert utentes:refresh_domains_view_with_unidade from pg

BEGIN;

DROP MATERIALIZED VIEW domains.domains;
CREATE MATERIALIZED VIEW domains.domains AS
WITH tmp_query AS (
SELECT category, key, value, ordering, parent, tooltip, app FROM domains.provincia WHERE (key IS NULL) OR (app IS NOT NULL)
UNION
SELECT 'utentes-provincia', key, value, ordering, parent, tooltip, null FROM domains.provincia
UNION
SELECT category, key, value, ordering, parent, tooltip, app FROM domains.distrito  WHERE app IS NOT NULL
UNION
SELECT 'utentes-distrito', key, value, ordering, parent, tooltip, null FROM domains.distrito
UNION
SELECT category, key, value, ordering, parent, tooltip, app FROM domains.posto WHERE app IS NOT NULL
UNION
SELECT 'utentes-posto', key, value, ordering, parent, tooltip, null FROM domains.posto
UNION
SELECT category, key, value, ordering, parent, tooltip, app FROM domains.bacia
UNION
SELECT category, key, value, ordering, parent, tooltip, app FROM domains.subacia
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.actividade
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.animal_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.cultivo_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.energia_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.fonte_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.industria_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip, app FROM domains.licencia_estado
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.licencia_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.pagamentos
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.boolean
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.rega_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.piscicultura_tipo_proc
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.piscicultura_gaio_subm
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.tanque_piscicola_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.tanque_piscicola_estado
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.tanque_piscicola_esp_culti
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.tanque_piscicola_tipo_alim
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.tanque_piscicola_prov_alev
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.tanque_piscicola_fert_agua
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.utentes_uten_tipo
UNION
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.fontes_sist_med
)
SELECT category, key, value, ordering, parent, tooltip FROM tmp_query WHERE app IS NULL OR ((SELECT key FROM domains.ara LIMIT 1) = ANY(app))
;


COMMIT;
