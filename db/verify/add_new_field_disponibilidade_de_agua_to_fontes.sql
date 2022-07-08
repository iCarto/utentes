-- Verify utentes:add_new_field_disponibilidade_de_agua_to_fontes on pg

BEGIN;

SELECT * FROM domains.fontes_disp_a WHERE false;

ROLLBACK;
