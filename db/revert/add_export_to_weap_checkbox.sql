-- Revert utentes:add_export_to_weap_checkbox from pg

BEGIN;

ALTER TABLE utentes.exploracaos DROP COLUMN p_tec_disp_hidrica;

ALTER TABLE utentes.renovacoes DROP COLUMN p_tec_disp_hidrica;

COMMIT;
