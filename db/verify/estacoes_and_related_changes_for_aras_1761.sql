-- Verify utentes:estacoes_and_related_changes_for_aras_1761 on pg

BEGIN;

SELECT alt_hidro, oxigeno_c, dioxido_l, silica, res_seco, deposito
FROM inventario.estacoes_analise
WHERE false;

SELECT 1/count(*) FROM inventario_dominios.gestao_estacoes WHERE
key = 'Outros' AND ordering = 10;

SELECT 1/count(*) FROM inventario_dominios.gestao_estacoes WHERE
key = 'ARA Centro' AND ordering = 1;

SELECT * FROM information_schema.columns
WHERE
    table_schema = 'inventario'
    AND table_name = 'estacoes_analise'
    AND column_name = 'nitratos'
    AND data_type = 'text'
;
SELECT * FROM information_schema.columns
WHERE
    table_schema = 'inventario'
    AND table_name = 'estacoes_analise'
    AND column_name = 'nitritos'
    AND data_type = 'text'
;
SELECT * FROM information_schema.columns
WHERE
    table_schema = 'inventario'
    AND table_name = 'estacoes_analise'
    AND column_name = 'coli_feca'
    AND data_type = 'text'
;
SELECT * FROM information_schema.columns
WHERE
    table_schema = 'inventario'
    AND table_name = 'estacoes_analise'
    AND column_name = 'coli_tot'
    AND data_type = 'text'
;
SELECT * FROM information_schema.columns
WHERE
    table_schema = 'inventario'
    AND table_name = 'estacoes_analise'
    AND column_name = 'amonio'
    AND data_type = 'text'
;


ROLLBACK;
