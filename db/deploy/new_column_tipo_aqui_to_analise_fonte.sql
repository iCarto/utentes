-- Deploy utentes:new_column_tipo_aqui_to_analise_fonte to pg

BEGIN;

ALTER TABLE inventario.fontes_analise ADD COLUMN tipo_aqui TEXT
    REFERENCES inventario_dominios.tipo_aqui(key) ON UPDATE CASCADE ON DELETE NO ACTION;

COMMIT;
