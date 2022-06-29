-- Deploy utentes:drop_iva_xx_columns to pg

BEGIN;

ALTER TABLE utentes.facturacao
      DROP COLUMN iva_sup
      , DROP COLUMN iva_sub;

COMMIT;
