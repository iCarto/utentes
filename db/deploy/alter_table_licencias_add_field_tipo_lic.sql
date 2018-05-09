-- Deploy utentes:alter_table_licencias_add_field_tipo_lic to pg

BEGIN;

CREATE TABLE domains.licencia_tipo_lic
(
  category text,
  key text,
  value text,
  ordering integer,
  parent text,
  tooltip text,
  app text[],
  CONSTRAINT tipo_lic_key_key UNIQUE (key)
);

INSERT INTO domains.licencia_tipo_lic VALUES ('licencia_tipo_lic', null, null, 0, null, null, null);
INSERT INTO domains.licencia_tipo_lic VALUES ('licencia_tipo_lic', 'Concessão', null, 1, null, null, null);
INSERT INTO domains.licencia_tipo_lic VALUES ('licencia_tipo_lic', 'Licença', null, 2, null, null, null);
INSERT INTO domains.licencia_tipo_lic VALUES ('licencia_tipo_lic', 'Autorização', null, 3, null, null, null);

DROP MATERIALIZED VIEW domains.domains;
CREATE MATERIALIZED VIEW domains.domains AS
WITH tmp_query AS (
SELECT category, key, value, ordering, parent, tooltip, app FROM domains.provincia WHERE (key IS null) OR (app IS NOT null)
UNION
SELECT 'utentes-provincia', key, value, ordering, parent, tooltip, null FROM domains.provincia
UNION
SELECT category, key, value, ordering, parent, tooltip, app FROM domains.distrito  WHERE app IS NOT null
UNION
SELECT 'utentes-distrito', key, value, ordering, parent, tooltip, null FROM domains.distrito
UNION
SELECT category, key, value, ordering, parent, tooltip, app FROM domains.posto WHERE app IS NOT null
UNION
SELECT 'utentes-posto', key, value, ordering, parent, tooltip, null FROM domains.posto
UNION

SELECT category, key, value, ordering, parent, tooltip, app FROM domains.unidade
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
UNION
SELECT category, key, value, ordering, parent, tooltip, app FROM domains.licencia_tipo_lic
)
SELECT category, key, value, ordering, parent, tooltip FROM tmp_query WHERE app IS null OR ((SELECT key FROM domains.ara LIMIT 1) = ANY(app))
;

ALTER TABLE utentes.licencias ADD COLUMN tipo_lic text;

ALTER TABLE utentes.licencias
   ADD CONSTRAINT tipo_licencia_fkey
   FOREIGN KEY (tipo_lic)
   REFERENCES domains.licencia_tipo_lic(key) ON UPDATE CASCADE;


COMMIT;
