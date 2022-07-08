-- Revert utentes:estacoes_and_related_changes_for_aras_1761 from pg

BEGIN;

INSERT INTO inventario_dominios.gestao_estacoes (key, ordering) VALUES ('', 2);

UPDATE inventario_dominios.gestao_estacoes SET
    key = 'ARA-Norte'
    , ordering = 0
WHERE key = 'ARA Norte';

UPDATE inventario_dominios.gestao_estacoes SET ordering = 1 WHERE key = 'INAM';

DELETE FROM inventario_dominios.gestao_estacoes
WHERE key IN ('ARA Sul', 'ARA Zambeze', 'ARA Centro-Norte', 'ARA Centro', 'DNGRH', 'INIA', 'Particular', 'Outros');

ALTER TABLE inventario.estacoes_analise DROP COLUMN alt_hidro;
ALTER TABLE inventario.estacoes_analise DROP COLUMN oxigeno_c;
ALTER TABLE inventario.estacoes_analise DROP COLUMN dioxido_l;
ALTER TABLE inventario.estacoes_analise DROP COLUMN silica;
ALTER TABLE inventario.estacoes_analise DROP COLUMN res_seco;
ALTER TABLE inventario.estacoes_analise DROP COLUMN deposito;

-- IMPORTANTE. Esto sólo funciona porqué no tenemos datos en esta tabla
-- si los hubiera habría que decidir que hacer con los textos de verdad
-- y convertir los texto-número a número
ALTER TABLE inventario.estacoes_analise ALTER COLUMN nitratos TYPE numeric(10, 2) USING nitratos::numeric(10, 2);
ALTER TABLE inventario.estacoes_analise ALTER COLUMN nitritos TYPE numeric(10, 2) USING nitritos::numeric(10, 2);
ALTER TABLE inventario.estacoes_analise ALTER COLUMN coli_feca TYPE numeric(10, 2) USING coli_feca::numeric(10, 2);
ALTER TABLE inventario.estacoes_analise ALTER COLUMN coli_tot TYPE numeric(10, 2) USING coli_tot::numeric(10, 2);
ALTER TABLE inventario.estacoes_analise ALTER COLUMN amonio TYPE numeric(10, 2) USING amonio::numeric(10, 2);

COMMIT;
