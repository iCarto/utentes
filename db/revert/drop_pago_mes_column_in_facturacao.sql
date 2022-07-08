-- Revert utentes:drop_pago_mes_column_in_facturacao from pg

BEGIN;

ALTER TABLE utentes.facturacao ADD COLUMN pago_mes numeric(10,2);

UPDATE utentes.facturacao SET
       pago_mes = COALESCE(pago_mes_sub, 0) + COALESCE(pago_mes_sup, 0)
;


COMMIT;
