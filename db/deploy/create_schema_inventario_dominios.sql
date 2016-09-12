-- Deploy sixhiara:create_schema_inventario_dominios to pg

BEGIN;

-- CREATE SCHEMA inventario_dominios AUTHORIZATION sixhiara_owner;
CREATE SCHEMA inventario_dominios;

CREATE TABLE inventario_dominios.tip_fonte (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
INSERT INTO inventario_dominios.tip_fonte (key, ordering) VALUES ('Albufeira', 0), ('Furo', 1), ('Nascente', 2), ('Poço', 3), ('Poço aberto', 4);

CREATE TABLE inventario_dominios.red_monit (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
INSERT INTO inventario_dominios.red_monit (key, ordering) VALUES ('NO', 0), ('Base', 1), ('Base e qualidade', 2), ('Velho-Sustituído', 3);

CREATE TABLE inventario_dominios.propiedad (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
INSERT INTO inventario_dominios.propiedad (key, ordering) VALUES ('Público', 0), ('Privado', 1);

CREATE TABLE inventario_dominios.tipo_pozo (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);
INSERT INTO inventario_dominios.tipo_pozo (key, ordering) VALUES ('Escavado', 0), ('Perfurado', 1);

CREATE TABLE inventario_dominios.cond_most (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.cond_most (key, ordering) VALUES ('Boas', 0), ('Regulares', 1), ('Más', 2);


CREATE TABLE inventario_dominios.tipo_hidr (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.tipo_hidr (key, ordering) VALUES ('Livre', 0), ('Confinado', 1), ('Semiconfinado', 2);

CREATE TABLE inventario_dominios.tipo_lito (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.tipo_lito (key, ordering) VALUES ('Sedimentos não consolidados', 0), ('Rochas', 1);

CREATE TABLE inventario_dominios.tipo_poro (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.tipo_poro (key, ordering) VALUES ('Poros', 0), ('Fracturas', 1), ('Karst', 2);

CREATE TABLE inventario_dominios.estado (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.estado (key, ordering) VALUES ('Bo', 0), ('Regular', 1), ('Mau', 2), ('Não operacional', 3);

CREATE TABLE inventario_dominios.estado_ampliado (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.estado_ampliado (key, ordering) VALUES ('Bo', 0), ('Regular', 1), ('Mau', 2), ('Não operacional', 3), ('Em carteira', 4);

CREATE TABLE inventario_dominios.tip_barra (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.tip_barra (key, ordering) VALUES ('Barragem', 0), ('Minibarragem', 1), ('Microbarragem', 2), ('Represa', 3);

CREATE TABLE inventario_dominios.gestao (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.gestao (key, ordering) VALUES ('ARA-Norte', 0), ('Privada', 1);

CREATE TABLE inventario_dominios.fiab_info (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.fiab_info (key, ordering) VALUES ('Boa', 0), ('Regular', 1), ('Má', 2);

CREATE TABLE inventario_dominios.tip_pluvi (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.tip_pluvi (key, ordering) VALUES ('Manual', 0), ('Automático', 1);

CREATE TABLE inventario_dominios.precisao (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.precisao (key, ordering) VALUES ('Boa', 0), ('Regular', 1), ('Má', 2);

CREATE TABLE inventario_dominios.frecuencia (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.frecuencia (key, ordering) VALUES ('Diaria', 0), ('Semanal', 1), ('Mensual', 2);

CREATE TABLE inventario_dominios.gestao_estacoes (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.gestao_estacoes (key, ordering) VALUES ('ARA-Norte', 0), ('INAM', 1), ('', 2);

CREATE TABLE inventario_dominios.tip_estac (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.tip_estac (key, ordering) VALUES ('Hidrométrica', 0), ('Pluviométrica', 1);

CREATE TABLE inventario_dominios.c_nitrat (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.c_nitrat (key, ordering) VALUES ('< 10', 0), ('10 - 25', 1), ('25 - 50', 2), ('50 - 100', 3), ('100 - 250', 4), ('> 250', 5);

CREATE TABLE inventario_dominios.c_nitrit (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

INSERT INTO inventario_dominios.c_nitrit (key, ordering) VALUES ('< 10', 0), ('10 - 25', 1), ('25 - 50', 2), ('50 - 100', 3), ('100 - 250', 4), ('> 250', 5);


-- GRANT USAGE ON SCHEMA inventario_dominios TO inventario_read;
-- GRANT SELECT ON ALL TABLES IN SCHEMA inventario_dominios TO inventario_read;


COMMIT;
