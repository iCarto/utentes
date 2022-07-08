-- Verify utentes:add_export_to_weap_checkbox on pg

BEGIN;

SELECT p_tec_disp_hidrica FROM utentes.exploracaos WHERE false;
SELECT p_tec_disp_hidrica FROM utentes.renovacoes WHERE false;

ROLLBACK;
