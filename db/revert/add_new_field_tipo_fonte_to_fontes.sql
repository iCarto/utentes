-- Revert utentes:add_new_field_tipo_fonte_to_fontes from pg

BEGIN;

DELETE FROM domains.fonte_tipo WHERE key='Mar' AND parent='Superficial';

COMMIT;
