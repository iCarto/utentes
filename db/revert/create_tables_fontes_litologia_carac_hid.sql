-- Revert utentes:create_tables_fontes_litologia_carac_hid from pg

BEGIN;

DROP TABLE inventario_dominios.litologia;
DROP TABLE inventario_dominios.carac_lit;
DROP TABLE inventario.fontes_litologia;

DROP TABLE inventario_dominios.tipo_cama;
DROP TABLE inventario_dominios.tipo_aqui;
DROP TABLE inventario.fontes_carac_hidro;

COMMIT;
