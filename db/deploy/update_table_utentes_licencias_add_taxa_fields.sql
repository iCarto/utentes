-- Deploy utentes:update_table_utentes_licencias_add_taxa_fields to pg

BEGIN;

ALTER TABLE utentes.licencias
    ADD COLUMN taxa_fixa NUMERIC(10,2),
    ADD COLUMN taxa_uso NUMERIC (10,2),
    ADD COLUMN pago_mes NUMERIC(10,2),
    ADD COLUMN iva INTEGER DEFAULT 17,
    ADD COLUMN pago_iva NUMERIC(10,2);

CREATE FUNCTION utentes.calcular_pagos_licencias() RETURNS trigger AS $$
BEGIN
    NEW.pago_mes := NEW.taxa_fixa + (COALESCE(NEW.c_licencia,0) * NEW.taxa_uso);
    NEW.pago_iva := NEW.pago_mes * (1 + NEW.iva::float/100);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ALTER FUNCTION utentes.calcular_pagos_licencias() OWNER TO :"owner";

CREATE TRIGGER calcular_pagos_licencias
    BEFORE INSERT OR UPDATE ON utentes.licencias
    FOR EACH ROW
    EXECUTE PROCEDURE utentes.calcular_pagos_licencias();

UPDATE utentes.licencias SET taxa_fixa = 0 WHERE taxa_fixa IS NULL AND estado NOT IN ('Irregular', 'Não aprovada', 'Pendente de solicitação do utente', 'Pendente de revisão da solicitação (Direcção)', 'Pendente de revisão da solicitação (Chefe DT)', 'Pendente de revisão da solicitação (D. Jurídico)', 'Pendente de aprovação técnica (R. Cadastro)');
UPDATE utentes.licencias SET taxa_uso = 0 WHERE taxa_uso IS NULL AND estado NOT IN ('Irregular', 'Não aprovada', 'Pendente de solicitação do utente', 'Pendente de revisão da solicitação (Direcção)', 'Pendente de revisão da solicitação (Chefe DT)', 'Pendente de revisão da solicitação (D. Jurídico)', 'Pendente de aprovação técnica (R. Cadastro)');

COMMIT;
