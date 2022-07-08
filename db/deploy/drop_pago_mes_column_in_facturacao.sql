-- Deploy utentes:drop_pago_mes_column_in_facturacao to pg

BEGIN;

ALTER TABLE utentes.facturacao DROP COLUMN pago_mes;


COMMIT;
