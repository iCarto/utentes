-- Revert utentes:add_new_fields_to_actividades_piscicultura from pg

BEGIN;

DELETE FROM domains.tanque_piscicola_esp_culti where key = 'Carpa';
DELETE FROM domains.tanque_piscicola_esp_culti where key = 'Tainha';

UPDATE domains.tanque_piscicola_esp_culti SET ordering = ordering - 2 where key = 'Outros';

ALTER TABLE utentes.actividades_piscicultura
    DROP COLUMN tipo_agua,
    DROP COLUMN esp_culti;


UPDATE domains.piscicultura_tipo_proc SET key = 'Vivo' where key = 'Fresco';
UPDATE domains.piscicultura_tipo_proc SET key = 'Geado' where key = 'Congelado';

DELETE FROM domains.piscicultura_tipo_proc where key = 'Refrigerado';

DROP table domains.fontes_tipo_agua;

COMMIT;
