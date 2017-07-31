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
('Singular/Particular', NULL, 1, NULL, NULL),
('Sociedade unipessoal', NULL, 2, NULL, NULL),
('Sociedade', NULL, 3, NULL, NULL),
('Associação', NULL, 4, NULL, NULL),
('Outro', NULL, 5, NULL, NULL);


ALTER TABLE utentes.utentes
ADD COLUMN uten_tipo TEXT REFERENCES domains.utentes_uten_tipo(key) ON UPDATE CASCADE ON DELETE NO ACTION,
ADD COLUMN uten_gere TEXT,
ADD COLUMN uten_memb INTEGER,
ADD COLUMN uten_mulh INTEGER,
ADD COLUMN contacto TEXT,
ADD COLUMN email TEXT,
ADD COLUMN telefone TEXT;

UPDATE utentes.utentes SET observacio = observacio || '\n' || entidade WHERE entidade is not null;
UPDATE utentes.utentes SET uten_tipo = 'Sociedade unipessoal' WHERE entidade ilike '%unipes%';
UPDATE utentes.utentes SET uten_tipo = 'Sociedade' WHERE entidade ilike 'sociedade%' AND entidade NOT ILIKE '%unipes%';
UPDATE utentes.utentes SET uten_tipo = 'Singular/Particular' WHERE entidade ilike 'singular%';

ALTER TABLE utentes.utentes DROP COLUMN entidade;


COMMIT;
