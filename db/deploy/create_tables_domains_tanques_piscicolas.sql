-- Deploy utentes:create_tables_domains_tanques_piscicolas to pg

BEGIN;

CREATE TABLE domains.tanque_piscicola_tipo (
    category text DEFAULT 'tanque_piscicola_tipo',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
-- ALTER TABLE domains.tanque_pisciola_tipo OWNER TO utentes;

INSERT INTO domains.tanque_piscicola_tipo (key, ordering) VALUES
(NULL, 0),
('Gaiola', 1),
('Tanque', 2);



CREATE TABLE domains.tanque_piscicola_estado (
    category text DEFAULT 'tanque_piscicola_estado',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
-- ALTER TABLE domains.tanque_pisciola_estado OWNER TO utentes;

INSERT INTO domains.tanque_piscicola_estado (key, value, ordering, parent, tooltip) VALUES
(NULL, NULL, 0, NULL, NULL),
('Operacional', NULL, 1, NULL, NULL),
('Não operacional', NULL, 2, NULL, NULL);


CREATE TABLE domains.tanque_piscicola_esp_culti (
    category text DEFAULT 'tanque_piscicola_esp_culti',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
-- ALTER TABLE domains.tanque_piscicola_esp_culti OWNER TO utentes;

INSERT INTO domains.tanque_piscicola_esp_culti (key, value, ordering, parent, tooltip) VALUES
(NULL, NULL, 0, NULL, NULL),
('Peixe gato', NULL, 1, NULL, NULL),
('Tilapia mossambicus', NULL, 2, NULL, NULL),
('Tilapia nilótica', NULL, 3, NULL, NULL),
('Outros', NULL, 4, NULL, NULL);


CREATE TABLE domains.tanque_piscicola_tipo_alim (
    category text DEFAULT 'tanque_piscicola_tipo_alim',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
-- ALTER TABLE domains.tanque_piscicola_tipo_alim OWNER TO utentes;

INSERT INTO domains.tanque_piscicola_tipo_alim (key, value, ordering, parent, tooltip) VALUES
('Farelo de milho', NULL, 0, NULL, NULL),
('Farelo de arroz', NULL, 1, NULL, NULL),
('Folhas de amendoim', NULL, 2, NULL, NULL),
('Mapira', NULL, 3, NULL, NULL),
('Meixoeira', NULL, 4, NULL, NULL),
('Nada', NULL, 5, NULL, NULL),
('Ração comprada', NULL, 6, NULL, NULL),
('Ração feita', NULL, 7, NULL, NULL),
('Restos de comida', NULL, 8, NULL, NULL),
('Térmites', NULL, 9, NULL, NULL),
('Verdudas', NULL, 10, NULL, NULL),
('Outros', NULL, 11, NULL, NULL);


CREATE TABLE domains.tanque_piscicola_prov_alev (
    category text DEFAULT 'tanque_piscicola_prov_alev',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
-- ALTER TABLE domains.tanque_pisciola_prov_alev OWNER TO utentes;

INSERT INTO domains.tanque_piscicola_prov_alev (key, ordering) VALUES
(NULL, 0),
('Melhorados', 1),
('Selvagens', 2),
('Reprodução nos tanques', 2),
('Outros', 2);


CREATE TABLE domains.tanque_piscicola_fert_agua (
    category text DEFAULT 'tanque_piscicola_fert_agua',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
-- ALTER TABLE domains.tanque_pisciola_fert_agua OWNER TO utentes;

INSERT INTO domains.tanque_piscicola_fert_agua (key, ordering) VALUES
(NULL, 0),
('Estrume', 1),
('URELA', 3),
('NPK', 4),
('Outros', 5);


COMMIT;
