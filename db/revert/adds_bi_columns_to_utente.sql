-- Revert utentes:adds_bi_columns_to_utente from pg

BEGIN;

ALTER TABLE utentes.utentes
    DROP COLUMN bi_di_pas
    , DROP COLUMN bi_d_emis
    , DROP COLUMN bi_l_emis
;

COMMIT;
