-- Revert utentes:alter_default_values_for_consumo_to_fixo from pg

BEGIN;

ALTER TABLE utentes.licencias ALTER COLUMN consumo_tipo SET DEFAULT 'Variável';
ALTER TABLE utentes.facturacao ALTER COLUMN consumo_tipo_sup SET DEFAULT 'Variável';
ALTER TABLE utentes.facturacao ALTER COLUMN consumo_tipo_sub SET DEFAULT 'Variável';

COMMIT;
