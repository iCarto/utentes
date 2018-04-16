-- Verify utentes:alter_table_fontes_analise_add_new_fields on pg

BEGIN;

SELECT sulfatos FROM inventario.fontes_analise;
SELECT fluoreto FROM inventario.fontes_analise;

ROLLBACK;
