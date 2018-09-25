-- Verify utentes:add_new_fields_to_actividades_piscicultura on pg

BEGIN;

SELECT * FROM domains.fontes_tipo_agua where false;

SELECT 1/count(*) FROM domains.fontes_tipo_agua WHERE key = 'Água salobre';
SELECT 1/count(*) FROM domains.fontes_tipo_agua WHERE key = 'Agua doce';
SELECT 1/count(*) FROM domains.fontes_tipo_agua WHERE key = 'Outros';

SELECT 1/count(*) FROM domains.tanque_piscicola_esp_culti WHERE key = 'Carpa';
SELECT 1/count(*) FROM domains.tanque_piscicola_esp_culti WHERE key = 'Tainha';

SELECT 1/count(*) FROM domains.piscicultura_tipo_proc WHERE key = 'Refrigerado';

SELECT tipo_agua, esp_culti, prov_alev FROM utentes.actividades_piscicultura where false;

ROLLBACK;
