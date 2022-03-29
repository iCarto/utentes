-- Verify utentes:add_column_periodo_fact_to_facturacao on pg

BEGIN;

SELECT periodo_fact FROM utentes.facturacao WHERE false;;
-- SELECT periodo_fact_real FROM utentes.facturacao WHERE false;;


SELECT 1/count(*) FROM information_schema.columns WHERE table_schema = 'utentes' AND table_name = 'facturacao' and column_name = 'periodo_fact' AND is_nullable = 'NO' AND data_type = 'daterange';
-- SELECT 1/count(*) FROM information_schema.columns WHERE table_schema = 'utentes' AND table_name = 'facturacao' and column_name = 'periodo_fact_real' AND is_nullable = 'NO' AND data_type = 'daterange';

ROLLBACK;
