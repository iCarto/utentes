-- Deploy utentes:create_table_domains_size_category to pg

BEGIN;

CREATE TABLE domains.size_category (
    category text PRIMARY KEY
    , consumo_range numrange NOT NULL
    , consumo_tipo text NOT NULL REFERENCES domains.facturacao_consumo_tipo (key)
    , fact_tipo text NOT NULL REFERENCES domains.facturacao_fact_tipo (key)
);

INSERT INTO domains.size_category
VALUES (
    'Mini exploração'
    , '[, 1000)' ::numrange
    , 'Fixo'
    , 'Anual')
, (
    'Pequena exploração'
    , '[1000, 10000)' ::numrange
    , 'Fixo'
    , 'Trimestral')
, (
    'Mediana exploração'
    , '[10000, 25000)' ::numrange
    , 'Fixo'
    , 'Trimestral')
, (
    'Grande exploração'
    , '[25000,)' ::numrange
    , 'Variável'
    , 'Mensal');

REVOKE ALL ON TABLE domains.size_category FROM PUBLIC;

GRANT SELECT ON TABLE domains.size_category TO sirha_base_user;

COMMIT;
