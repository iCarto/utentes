-- Deploy utentes:add_new_field_disponibilidade_de_agua_to_fontes to pg

BEGIN;

CREATE TABLE domains.fontes_disp_a (
    category text DEFAULT 'piscicultura_fontes_disp_a',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO domains.fontes_disp_a (key, ordering) VALUES
(NULL, 0),
('Anual', 1),
('Com mares vivas', 2),
('Sazonal', 3),
('Outros', 4);

ALTER TABLE utentes.fontes
    ADD COLUMN disp_a TEXT REFERENCES domains.fontes_disp_a(key) ON UPDATE CASCADE ON DELETE NO ACTION;






COMMIT;
