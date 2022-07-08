-- Verify utentes:create_tables_fontes_litologia_carac_hid on pg

BEGIN;

SELECT * FROM inventario_dominios.litologia WHERE FALSE;
SELECT * FROM inventario_dominios.carac_lit WHERE FALSE;
SELECT * FROM inventario.fontes_litologia WHERE FALSE;

SELECT * FROM inventario_dominios.tipo_cama WHERE FALSE;
SELECT * FROM inventario_dominios.tipo_aqui WHERE FALSE;
SELECT * FROM inventario.fontes_carac_hidro WHERE FALSE;

ROLLBACK;
