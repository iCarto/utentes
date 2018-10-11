-- Deploy utentes:add_new_field_tipo_fonte_to_fontes to pg

BEGIN;

ALTER TABLE domains.fonte_tipo ALTER COLUMN category SET DEFAULT 'fonte_tipo';
INSERT INTO domains.fonte_tipo (category, key, parent) VALUES
    ('fonte_tipo', 'Mar', 'Superficial');

COMMIT;
