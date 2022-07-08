-- Verify utentes:modify_values_of_domain_tip_barra on pg

BEGIN;



SELECT 1/count(*) FROM inventario_dominios.tip_barra WHERE key = 'Açude';
SELECT 1/count(*) FROM inventario_dominios.tip_barra WHERE key = 'Reserv. Esc';

DO $$
BEGIN


    PERFORM true
        FROM inventario_dominios.tip_barra
        WHERE key IN ('Minibarragen', 'Microbarragen')
    ;
    IF FOUND THEN
        RAISE EXCEPTION 'Error 1';
    END IF;

    PERFORM true
        FROM inventario.barragens
        WHERE tip_barra IN ('Minibarragen', 'Microbarragen')
    ;
    IF FOUND THEN
        RAISE EXCEPTION 'Error 2';
    END IF;
END;
$$;

ROLLBACK;
