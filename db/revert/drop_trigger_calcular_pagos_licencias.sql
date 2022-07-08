-- Revert utentes:drop_trigger_calcular_pagos_licencias from pg

BEGIN;

CREATE OR REPLACE FUNCTION utentes.calcular_pagos_licencias()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    NEW.pago_mes := NEW.taxa_fixa + (COALESCE(NEW.consumo_fact, 0) * NEW.taxa_uso);
    NEW.pago_iva := NEW.pago_mes * (1 + NEW.iva/100);
    RETURN NEW;
END;
$function$;

CREATE TRIGGER calcular_pagos_licencias
BEFORE INSERT OR UPDATE ON utentes.licencias
FOR EACH ROW EXECUTE PROCEDURE utentes.calcular_pagos_licencias();

COMMIT;
