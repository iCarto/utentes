-- Verify utentes:not_allows_null_values_in_facturacao_iva on pg

BEGIN;

SELECT 1/count(*)
FROM information_schema.columns WHERE table_schema = 'utentes' AND table_name = 'facturacao' and column_name = 'iva' AND is_nullable = 'NO';

ROLLBACK;
