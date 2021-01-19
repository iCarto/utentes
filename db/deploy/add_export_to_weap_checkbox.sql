-- Deploy utentes:add_export_to_weap_checkbox to pg

BEGIN;

ALTER TABLE utentes.exploracaos
    ADD COLUMN p_tec_disp_hidrica boolean NOT NULL DEFAULT false;

COMMENT ON COLUMN utentes.exploracaos.p_tec_disp_hidrica IS
    'Avaliação disponibilidade hídrica (WEAP WAM-T)';


ALTER TABLE utentes.renovacoes
    ADD COLUMN p_tec_disp_hidrica boolean NOT NULL DEFAULT false;

COMMENT ON COLUMN utentes.renovacoes.p_tec_disp_hidrica IS
    'Avaliação disponibilidade hídrica (WEAP WAM-T)';

COMMIT;
