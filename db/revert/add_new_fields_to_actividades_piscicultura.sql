-- Revert utentes:add_new_fields_to_actividades_piscicultura from pg

BEGIN;

DELETE FROM domains.tanque_piscicola_esp_culti where key = 'Carpa';
DELETE FROM domains.tanque_piscicola_esp_culti where key = 'Tainha';


ALTER TABLE utentes.actividades_piscicultura
    DROP COLUMN tipo_aqua,
    DROP COLUMN esp_culti,
    DROP COLUMN prov_alev
;


UPDATE domains.piscicultura_tipo_proc SET key = 'Vivo' where key = 'Fresco';
UPDATE domains.piscicultura_tipo_proc SET key = 'Geado' where key = 'Congelado';

DELETE FROM domains.piscicultura_tipo_proc where key = 'Refrigerado';

DROP table domains.actividades_piscicultura_tipo_aqua;


UPDATE domains.piscicultura_tipo_proc SET ordering = 1 where key = 'Geado';
UPDATE domains.piscicultura_tipo_proc SET ordering = 2 where key = 'Frito';
UPDATE domains.piscicultura_tipo_proc SET ordering = 3 where key = 'Fumado';
UPDATE domains.piscicultura_tipo_proc SET ordering = 4 where key = 'Seco';
UPDATE domains.piscicultura_tipo_proc SET ordering = 5 where key = 'Vivo';

UPDATE domains.tanque_piscicola_esp_culti SET ordering = 1 WHERE key = 'Peixe gato';
UPDATE domains.tanque_piscicola_esp_culti SET ordering = 2 WHERE key = 'Tilapia mossambicus';
UPDATE domains.tanque_piscicola_esp_culti SET ordering = 3 WHERE key = 'Tilapia nilótica';
UPDATE domains.tanque_piscicola_esp_culti SET ordering = 4 WHERE key = 'Outros';

DELETE FROM domains.piscicultura_gaio_subm WHERE key = 'Mar';
UPDATE domains.piscicultura_gaio_subm SET ordering = 1 WHERE key= 'Albufeira';
UPDATE domains.piscicultura_gaio_subm SET ordering = 2 WHERE key= 'Lago';
UPDATE domains.piscicultura_gaio_subm SET ordering = 3 WHERE key= 'Nascente';
UPDATE domains.piscicultura_gaio_subm SET ordering = 4 WHERE key= 'Río';


COMMIT;
