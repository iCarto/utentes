-- Deploy utentes:drop_trigger_calcular_pagos_licencias to pg

BEGIN;

DROP TRIGGER calcular_pagos_licencias ON utentes.licencias;
DROP FUNCTION utentes.calcular_pagos_licencias();

COMMIT;
