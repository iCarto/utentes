-- Revert utentes:drop_iva_xx_columns from pg

BEGIN;

ALTER TABLE utentes.facturacao ADD COLUMN iva_sub numeric(10,2);
ALTER TABLE utentes.facturacao ADD COLUMN iva_sup numeric(10,2);

UPDATE utentes.facturacao SET
       iva_sub = iva,
       iva_sup = iva
;

COMMIT;
