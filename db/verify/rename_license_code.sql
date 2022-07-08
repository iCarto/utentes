-- Verify utentes:rename_license_code on pg

BEGIN;

SELECT 'utentes.code_for_state(text, text)'::regprocedure;
SELECT has_function_privilege(:'base_user', 'utentes.code_for_state(text, text)', 'execute');

DO $$
BEGIN
    PERFORM true
       FROM utentes.exploracaos
      WHERE length(exp_id) != 16;
    IF FOUND THEN
        RAISE EXCEPTION 'Hay explotaciones sin un código de 16 caracteres';
    END IF;
END;
$$;

DO $$
BEGIN
    PERFORM true
       FROM utentes.licencias
      WHERE length(lic_nro) != 20;
    IF FOUND THEN
        RAISE EXCEPTION 'Hay licencias sin un código de 21 caracteres';
    END IF;
END;
$$;


ROLLBACK;
