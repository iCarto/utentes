-- Revert utentes:add_new_field_disponibilidade_de_agua_to_fontes from pg

BEGIN;

ALTER TABLE utentes.fontes DROP COLUMN disp_a;

DROP table domains.fontes_disp_a;

COMMIT;
