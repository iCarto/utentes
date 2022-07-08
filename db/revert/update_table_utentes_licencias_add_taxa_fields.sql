-- Revert utentes:update_table_utentes_licencias_add_taxa_fields from pg

BEGIN;

DROP TRIGGER calcular_pagos_licencias ON utentes.licencias;
DROP FUNCTION utentes.calcular_pagos_licencias();

ALTER TABLE utentes.licencias
    DROP COLUMN taxa_fixa,
    DROP COLUMN taxa_uso,
    DROP COLUMN pago_mes,
    DROP COLUMN iva,
    DROP COLUMN pago_iva;

COMMIT;
