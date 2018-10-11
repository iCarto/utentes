-- Deploy utentes:add_new_fields_to_actividades_piscicultura to pg

BEGIN;

CREATE TABLE domains.actividades_piscicultura_tipo_aqua (
    category text DEFAULT 'actividades_piscicultura_tipo_aqua',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO domains.actividades_piscicultura_tipo_aqua (key, ordering) VALUES
(NULL, 0),
('Agua doce', 1),
('Água salobre', 2),
('Outros', 3);


INSERT INTO domains.tanque_piscicola_esp_culti (key, ordering) VALUES
('Carpa', NULL),
('Tainha', NULL);

UPDATE domains.tanque_piscicola_esp_culti SET ordering = 1 WHERE key = 'Carpa';
UPDATE domains.tanque_piscicola_esp_culti SET ordering = 2 WHERE key = 'Peixe gato';
UPDATE domains.tanque_piscicola_esp_culti SET ordering = 3 WHERE key = 'Tainha';
UPDATE domains.tanque_piscicola_esp_culti SET ordering = 4 WHERE key = 'Tilapia mossambicus';
UPDATE domains.tanque_piscicola_esp_culti SET ordering = 5 WHERE key = 'Tilapia nilótica';
UPDATE domains.tanque_piscicola_esp_culti SET ordering = 6 WHERE key = 'Outros';



INSERT INTO domains.piscicultura_gaio_subm (key) VALUES ('Mar');
UPDATE domains.piscicultura_gaio_subm SET ordering = 1 WHERE key= 'Albufeira';
UPDATE domains.piscicultura_gaio_subm SET ordering = 2 WHERE key= 'Lago';
UPDATE domains.piscicultura_gaio_subm SET ordering = 3 WHERE key= 'Mar';
UPDATE domains.piscicultura_gaio_subm SET ordering = 4 WHERE key= 'Nascente';
UPDATE domains.piscicultura_gaio_subm SET ordering = 5 WHERE key= 'Río';


UPDATE domains.piscicultura_tipo_proc SET key = 'Congelado' where key = 'Geado';
UPDATE domains.piscicultura_tipo_proc SET key = 'Fresco' where key = 'Vivo';
INSERT INTO domains.piscicultura_tipo_proc (key, ordering) VALUES ('Refrigerado', NULL);
UPDATE domains.piscicultura_tipo_proc SET ordering = 1 where key = 'Congelado';
UPDATE domains.piscicultura_tipo_proc SET ordering = 2 where key = 'Fresco';
UPDATE domains.piscicultura_tipo_proc SET ordering = 3 where key = 'Frito';
UPDATE domains.piscicultura_tipo_proc SET ordering = 4 where key = 'Fumado';
UPDATE domains.piscicultura_tipo_proc SET ordering = 5 where key = 'Refrigerado';
UPDATE domains.piscicultura_tipo_proc SET ordering = 6 where key = 'Seco';

UPDATE domains.tanque_piscicola_prov_alev SET ordering = 1 where key = 'Melhorados';
UPDATE domains.tanque_piscicola_prov_alev SET ordering = 2 where key = 'Reprodução nos tanques';
UPDATE domains.tanque_piscicola_prov_alev SET ordering = 3 where key = 'Selvagens';
UPDATE domains.tanque_piscicola_prov_alev SET ordering = 4 where key = 'Outros';


ALTER TABLE utentes.actividades_piscicultura
    ADD COLUMN tipo_aqua TEXT REFERENCES domains.actividades_piscicultura_tipo_aqua(key) ON UPDATE CASCADE ON DELETE NO ACTION,
    ADD COLUMN esp_culti TEXT[], --REFERENCES domains.tanque_piscicola_esp_culti(key) ON UPDATE CASCADE ON DELETE NO ACTION,
    ADD COLUMN prov_alev TEXT[] -- --REFERENCES domains.tanque_piscicola_prov_ale(key) ON UPDATE CASCADE ON DELETE NO ACTION,
;

COMMIT;
