-- Deploy utentes:add_new_fields_to_actividades_piscicultura to pg

BEGIN;

CREATE TABLE domains.fontes_tipo_agua (
    category text DEFAULT 'fontes_tipo_agua',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO domains.fontes_tipo_agua (key, ordering) VALUES
(NULL, 0),
('Água salobre', 1),
('Agua doce', 2),
('Outros', 3);


INSERT INTO domains.tanque_piscicola_esp_culti (key, ordering) VALUES
('Carpa', 4),
('Tainha', 5);

UPDATE domains.tanque_piscicola_esp_culti SET ordering = ordering + 2 where key = 'Outros';

UPDATE domains.piscicultura_tipo_proc SET key = 'Fresco' where key = 'Vivo';
UPDATE domains.piscicultura_tipo_proc SET key = 'Congelado' where key = 'Geado';

INSERT INTO domains.piscicultura_tipo_proc (key, ordering) VALUES
('Refrigerado', 6);


ALTER TABLE utentes.actividades_piscicultura
    ADD COLUMN tipo_agua TEXT REFERENCES domains.fontes_tipo_agua(key) ON UPDATE CASCADE ON DELETE NO ACTION,
    ADD COLUMN esp_culti TEXT REFERENCES domains.tanque_piscicola_esp_culti(key) ON UPDATE CASCADE ON DELETE NO ACTION;

COMMIT;
