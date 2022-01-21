-- Revert utentes:create_function_exp_id_part from pg

BEGIN;

DROP FUNCTION utentes.exp_id_part(text);

COMMIT;
