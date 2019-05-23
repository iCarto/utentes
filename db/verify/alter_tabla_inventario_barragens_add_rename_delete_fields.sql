-- Verify utentes:alter_tabla_inventario_barragens_add_rename_delete_fields on pg

BEGIN;

SELECT comprimen FROM inventario.barragens WHERE FALSE;
SELECT npa FROM inventario.barragens WHERE FALSE;

SELECT capacidad FROM inventario.barragens WHERE FALSE;
SELECT observacio FROM inventario.barragens WHERE FALSE;

ROLLBACK;
