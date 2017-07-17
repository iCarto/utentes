-- Deploy utentes:alter_table_utentes_add_new_fields to pg

BEGIN;

CREATE TABLE domains.utentes_uten_tipo (
    category text DEFAULT 'utentes_uten_tipo',
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
-- ALTER TABLE domains.utentes_uten_tipo OWNER TO ...
INSERT INTO domains.utentes_uten_tipo (key, value, ordering, parent, tooltip) VALUES
(NULL, NULL, 0, NULL, NULL),
('Pessoa física', NULL, 1, NULL, NULL),
('Empresa ', NULL, 2, NULL, NULL),
('Associação', NULL, 3, NULL, NULL),
('Outro', NULL, 4, NULL, NULL);


ALTER TABLE utentes.utentes
ADD COLUMN uten_tipo TEXT REFERENCES domains.utentes_uten_tipo(key) ON UPDATE CASCADE ON DELETE NO ACTION,
ADD COLUMN uten_gere TEXT,
ADD COLUMN uten_memb INTEGER,
ADD COLUMN uten_mulh INTEGER,
ADD COLUMN contacto TEXT,
ADD COLUMN email TEXT,
ADD COLUMN telefone TEXT;

COMMIT;
