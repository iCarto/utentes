-- Deploy utentes:add_new_field_tipo_fonte_to_fontes to pg

BEGIN;

INSERT INTO domains.fonte_tipo (category, key, parent) VALUES
    ('fonte_tipo', 'Mar', 'Superficial');

COMMIT;
