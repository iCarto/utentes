-- Verify utentes:alter_table_facturacao_drop_column_pagos on pg

BEGIN;

SELECT 1/(count(*)-1) FROM information_schema.columns
WHERE table_schema = 'utentes' AND table_name='exploracao' AND column_name='pagos';

SELECT 1/(count(*)-1) FROM information_schema.columns
WHERE table_schema = 'utentes' AND table_name='facturacao' AND column_name='pagos';

ROLLBACK;
