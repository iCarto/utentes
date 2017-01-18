-- Verify utentes:update_table_utentes_licencias_add_taxa_fields on pg

BEGIN;

SELECT taxa_fixa, taxa_uso, pago_mes, iva FROM utentes.licencias;

ROLLBACK;
