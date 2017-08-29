-- Deploy sixhiara:create_tables_inventario_imagenes to pg

BEGIN;

CREATE TABLE inventario.fontes_imagenes (
    cod_fonte text PRIMARY KEY REFERENCES inventario.fontes(cod_fonte)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    image bytea
);

CREATE TABLE inventario.acuiferos_imagenes (
    cod_acuif text PRIMARY KEY REFERENCES inventario.acuiferos(cod_acuif)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    image bytea
);

CREATE TABLE inventario.estacoes_imagenes (
    cod_estac text PRIMARY KEY REFERENCES inventario.estacoes(cod_estac)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    image bytea
);

CREATE TABLE inventario.barragens_imagenes (
    cod_barra text PRIMARY KEY REFERENCES inventario.barragens(cod_barra)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    image bytea
);

COMMIT;
