-- Revisión facturación mensual
-- Saca todas las facturas desde Marzo de 2021
-- TODO: Se podría filtrar por estado_lic IN ('Licenciada', 'Utente de facto') si la query es lenta
WITH lics AS (
    SELECT
        exploracao
        , CASE WHEN count(*) = 2 THEN
            'Ambas'
        ELSE
            string_agg(tipo_agua
                , '')
        END tipo_agua
        , CASE WHEN count(*) = 2 THEN
            string_agg(DISTINCT consumo_tipo
                , ' ')
        ELSE
            string_agg(consumo_tipo
                , '')
        END consumo_tipo
    FROM
        utentes.licencias
    GROUP BY
        exploracao
    ORDER BY
        exploracao
        , tipo_agua
)
, exps AS (
    SELECT
        e.gid AS exp_gid
        , e.exp_id
        , e.exp_name
        , e.loc_divisao
        , e.c_licencia AS consumo_licenciado
        , e.estado_lic
        , e.fact_tipo
        , lics.tipo_agua
        , lics.consumo_tipo
    FROM
        utentes.exploracaos e
        JOIN lics ON e.gid = lics.exploracao
)
, invs AS (
    SELECT
        f.gid AS inv_gid
        , exps.loc_divisao
        , exps.exp_gid
        , exps.consumo_tipo
        , f.ano
        , f.mes
        , f.observacio
        , f.fact_estado fact_estado
        , f.fact_tipo inv_fact_tipo
        , f.c_licencia_sup
        , f.c_licencia_sub
        , f.consumo_tipo_sup
        , f.consumo_fact_sup
        , f.taxa_fixa_sup
        , f.taxa_uso_sup
        , f.pago_mes_sup
        , f.pago_iva_sup
        , f.iva_sup
        , f.consumo_tipo_sub
        , f.consumo_fact_sub
        , f.taxa_fixa_sub
        , f.taxa_uso_sub
        , f.pago_mes_sub
        , f.pago_iva_sub
        , f.iva_sub
        , f.iva
        , COALESCE(f.pago_mes_sup
            , 0) + COALESCE(f.pago_mes_sub
            , 0) AS pago_mes
        , f.pago_iva
        , f.fact_id
        , f.juros
        , f.recibo_id
        , f.fact_date
        , f.recibo_date
        , f.updated_at
        , exps.exp_id
        , exps.exp_name
        , exps.consumo_licenciado
        , exps.estado_lic
        , exps.fact_tipo exp_fact_tipo
        , exps.tipo_agua
    FROM
        utentes.facturacao f
        JOIN exps ON exps.exp_gid = f.exploracao
    WHERE
        f.ano::int >= 2021
        AND f.mes::int >= 3
)
SELECT
    now()::date AS "Data revisão"
    , ano AS "Ano Factura"
    , mes AS "Mês Factura"
    , exp_id AS "Número Exploração"
    , exp_name AS "Nome Exploração"
    , fact_estado AS "Estado Factura"
    , loc_divisao AS "Divisão"
    , estado_lic AS "Estado Licença"
    , tipo_agua AS "Tipo Água" -- con valores: 'Superficial', 'Subterrânea', 'Ambas'
    , exp_fact_tipo AS "Tipo Facturação" -- El último de la explotación. No el de la factura.
    , consumo_tipo AS "Tipo Consumo" -- valores 'Fixo', 'Variável', 'Fixo Variável', 'Variável Fixo'. El último de la licencia. No el de la factura.
FROM
    invs
ORDER BY
    inv_gid;

