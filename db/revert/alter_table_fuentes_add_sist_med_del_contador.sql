-- Revert utentes:alter_table_fuentes_add_sist_med_del_contador from pg

BEGIN;

-- Recreate the table contador
CREATE TABLE domains.contador (
    category text,
    key text,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

-- Repopulate the table contador
INSERT INTO domains.contador (category, key, value, ordering, parent, tooltip) VALUES ('contador', NULL, NULL, 0, NULL, NULL);
INSERT INTO domains.contador (category, key, value, ordering, parent, tooltip) VALUES ('contador', 'Existe', 'true', 1, NULL, NULL);
INSERT INTO domains.contador (category, key, value, ordering, parent, tooltip) VALUES ('contador', 'Não existe', 'false', 2, NULL, NULL);

-- Add column contador to fontes
ALTER TABLE utentes.fontes
    ADD COLUMN contador boolean;

-- Recover the content of column contador from others columns content
UPDATE utentes.fontes
    SET contador = (
        CASE
            WHEN sist_med='Contador' THEN TRUE
            WHEN lat_lon IS NULL AND d_dado IS NULL THEN NULL
            ELSE FALSE
        END
    );

-- Set to NULL the column sist_med to all rows
UPDATE utentes.fontes
    SET sist_med = NULL
    WHERE sist_med IS NOT NULL;

-- Drop the column sist_med
ALTER TABLE utentes.fontes
    DROP COLUMN sist_med;

-- Recreate the view domains with domains.contador and without domains.fontes_sist_med
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
SELECT category, key, value, ordering, parent, tooltip, null FROM domains.contador
)
SELECT category, key, value, ordering, parent, tooltip FROM tmp_query WHERE app IS NULL OR ((SELECT key FROM domains.ara LIMIT 1) = ANY(app))
;

-- Delete the table fontes_sist_med
DROP TABLE domains.fontes_sist_med;



COMMIT;
