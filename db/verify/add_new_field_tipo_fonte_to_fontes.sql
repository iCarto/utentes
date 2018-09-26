-- Verify utentes:add_new_field_tipo_fonte_to_fontes on pg

BEGIN;

SELECT 1/count(*) FROM domains.fonte_tipo WHERE key = 'Mar';

ROLLBACK;
