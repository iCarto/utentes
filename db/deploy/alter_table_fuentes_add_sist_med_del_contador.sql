-- Deploy utentes:alter_table_fuentes_add_sist_med_del_contador to pg

BEGIN;

-- Create table fontes_sist_med
CREATE TABLE domains.fontes_sist_med (
    key TEXT UNIQUE,
    category TEXT DEFAULT 'sistema_medicao',
    value text,
    ordering integer,
    parent text,
    tooltip text
);

-- Add data to table fontes_sist_med
INSERT INTO domains.fontes_sist_med (key, ordering) VALUES (null, 0);
INSERT INTO domains.fontes_sist_med (key, ordering) VALUES ('Contador', 1);
INSERT INTO domains.fontes_sist_med (key, ordering) VALUES ('Dotação', 2);
INSERT INTO domains.fontes_sist_med (key, ordering) VALUES ('Medidor Hidráulico', 3);
INSERT INTO domains.fontes_sist_med (key, ordering) VALUES ('Volumétrica', 4);

-- Add column to fontes
ALTER TABLE utentes.fontes
    ADD COLUMN sist_med TEXT references domains.fontes_sist_med(key);

-- Update column sist_med to existent data
UPDATE utentes.fontes
    SET sist_med = 'Contador'
    WHERE contador=TRUE;

-- Delete column contador from table fontes
ALTER TABLE utentes.fontes
    DROP COLUMN contador;

-- Recreate the view domains with domains.fontes_sist_med and without domains.contador
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

-- Delete table domains.contador
DROP table domains.contador;

COMMIT;
