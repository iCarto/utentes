-- Deploy utentes:alter_default_values_for_consumo_to_fixo to pg

BEGIN;

ALTER TABLE utentes.licencias ALTER COLUMN consumo_tipo SET DEFAULT 'Fixo';
ALTER TABLE utentes.facturacao ALTER COLUMN consumo_tipo_sup SET DEFAULT 'Fixo';
ALTER TABLE utentes.facturacao ALTER COLUMN consumo_tipo_sub SET DEFAULT 'Fixo';

COMMIT;
