-- Revert utentes:not_allows_null_values_in_facturacao_iva from pg

BEGIN;

ALTER TABLE utentes.facturacao ALTER COLUMN iva DROP NOT NULL;

COMMIT;
