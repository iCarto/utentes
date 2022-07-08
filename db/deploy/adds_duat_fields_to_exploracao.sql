-- Deploy utentes:adds_duat_fields_to_exploracao to pg

BEGIN;

ALTER TABLE utentes.exploracaos
    ADD COLUMN d_titulo text
    , ADD COLUMN d_proceso text
    , ADD COLUMN d_folha text
    , ADD COLUMN d_parcela text
    , ADD COLUMN d_area numeric(12, 4)
    , ADD COLUMN d_d_emis date
    , ADD COLUMN d_l_emis text
;

COMMENT ON COLUMN utentes.exploracaos.exp_id IS 'Número da exploração';
COMMENT ON COLUMN utentes.exploracaos.cadastro_uni IS 'Número do cadastro unificado';
COMMENT ON COLUMN utentes.exploracaos.d_titulo IS 'Número do título';
COMMENT ON COLUMN utentes.exploracaos.d_proceso IS 'Número do processo';
COMMENT ON COLUMN utentes.exploracaos.d_folha IS 'Número de folha';
COMMENT ON COLUMN utentes.exploracaos.d_parcela IS 'Número de parcela';
COMMENT ON COLUMN utentes.exploracaos.d_area IS 'Área (ha)';
COMMENT ON COLUMN utentes.exploracaos.d_d_emis IS 'Data de emissão ';
COMMENT ON COLUMN utentes.exploracaos.d_l_emis IS 'Local de emissão';

COMMIT;
