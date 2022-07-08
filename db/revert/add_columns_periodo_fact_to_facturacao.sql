-- Revert utentes:add_column_periodo_fact_to_facturacao from pg

BEGIN;

ALTER TABLE utentes.facturacao DROP COLUMN periodo_fact;
-- ALTER TABLE utentes.facturacao DROP COLUMN periodo_fact_real;

COMMIT;
