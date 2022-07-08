-- Verify utentes:drop_iva_xx_columns on pg

BEGIN;

SELECT 1/(count(*)-1) FROM information_schema.columns
WHERE table_schema = 'utentes' AND table_name='facturacao' AND column_name='iva_sup';

SELECT 1/(count(*)-1) FROM information_schema.columns
WHERE table_schema = 'utentes' AND table_name='facturacao' AND column_name='iva_sub';

ROLLBACK;
