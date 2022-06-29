-- Deploy utentes:not_allows_null_values_in_facturacao_iva to pg

BEGIN;

UPDATE utentes.facturacao SET iva = 0  WHERE iva IS NULL;
ALTER TABLE utentes.facturacao ALTER COLUMN iva SET NOT NULL;

COMMIT;
