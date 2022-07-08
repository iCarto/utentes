-- Revert utentes:adds_duat_fields_to_exploracao from pg

BEGIN;

ALTER TABLE utentes.exploracaos
    DROP COLUMN d_titulo
    , DROP COLUMN d_proceso
    , DROP COLUMN d_folha
    , DROP COLUMN d_parcela
    , DROP COLUMN d_area
    , DROP COLUMN d_d_emis
    , DROP COLUMN d_l_emis
;

COMMIT;
