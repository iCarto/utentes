-- Deploy utentes:adds_bi_columns_to_utente to pg

BEGIN;

ALTER TABLE utentes.utentes
    ADD COLUMN bi_di_pas text
    , ADD COLUMN bi_d_emis date
    , ADD COLUMN bi_l_emis text
;

COMMENT ON COLUMN utentes.utentes.bi_di_pas IS 'BI / Dire / Passaporte';
COMMENT ON COLUMN utentes.utentes.bi_d_emis IS 'Data de emissão ';
COMMENT ON COLUMN utentes.utentes.bi_l_emis IS 'Local de emissão';

COMMENT ON COLUMN utentes.utentes.reg_comerc IS 'Número de Registo Comercial';
COMMENT ON COLUMN utentes.utentes.reg_zona IS 'Local do registro';

COMMIT;
