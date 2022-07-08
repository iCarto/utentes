-- Verify utentes:drop_pago_mes_column_in_facturacao on pg

BEGIN;

SELECT 1/(count(*)-1) FROM information_schema.columns
WHERE table_schema = 'utentes' AND table_name='facturacao' AND column_name='pago_mes';

ROLLBACK;
