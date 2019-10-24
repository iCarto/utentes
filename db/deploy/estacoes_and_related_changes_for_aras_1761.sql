-- Deploy utentes:estacoes_and_related_changes_for_aras_1761 to pg

BEGIN;

/* Clean up */
UPDATE inventario_dominios.gestao_estacoes SET category = 'gestao_estacoes';
ALTER TABLE inventario_dominios.gestao_estacoes ALTER COLUMN category SET DEFAULT 'gestao_estacoes';
DELETE FROM inventario_dominios.gestao_estacoes WHERE key = '' AND value is null AND parent is null;

/* Add values to domain gestao_estacoes */
UPDATE inventario_dominios.gestao_estacoes SET key = 'ARA Norte' WHERE key = 'ARA-Norte';
-- INAM sin cambios
INSERT INTO inventario_dominios.gestao_estacoes (key) VALUES
('ARA Sul')
, ('ARA Zambeze')
, ('ARA Centro-Norte')
, ('ARA Centro')
, ('DNGRH')
, ('INIA')
, ('Particular')
, ('Outros')
;

-- Sort values alphabetically, puting 'Outra' in las place
WITH foo AS (
    SELECT row_number() OVER (ORDER BY key), key fookey
    FROM inventario_dominios.gestao_estacoes
    WHERE key != 'Outros'
)
UPDATE inventario_dominios.gestao_estacoes
SET ordering = row_number
FROM foo
WHERE key = fookey ;

UPDATE inventario_dominios.gestao_estacoes
SET ordering = (SELECT max(ordering) + 1 FROM inventario_dominios.gestao_estacoes)
WHERE key = 'Outros';


/* Add new columns */
ALTER TABLE inventario.estacoes_analise ADD COLUMN alt_hidro numeric(10, 2);
COMMENT ON COLUMN inventario.estacoes_analise.alt_hidro IS 'Altura hidrometrica (m)';

ALTER TABLE inventario.estacoes_analise ADD COLUMN oxigeno_c numeric(10, 2);
COMMENT ON COLUMN inventario.estacoes_analise.oxigeno_c IS 'Oxigénio Consumido (mg/l)';

ALTER TABLE inventario.estacoes_analise ADD COLUMN dioxido_l numeric(10, 2);
COMMENT ON COLUMN inventario.estacoes_analise.dioxido_l IS 'CO2 Livre (mgCO2/l)';

ALTER TABLE inventario.estacoes_analise ADD COLUMN silica numeric(10, 2);
COMMENT ON COLUMN inventario.estacoes_analise.silica IS 'Silica (mgSiO2/ l)';

ALTER TABLE inventario.estacoes_analise ADD COLUMN res_seco numeric(10, 2);
COMMENT ON COLUMN inventario.estacoes_analise. res_seco IS 'Resíduo Seco (18%) (mg/ l )';

ALTER TABLE inventario.estacoes_analise ADD COLUMN deposito text;
COMMENT ON COLUMN inventario.estacoes_analise.deposito IS 'Deposito';


/* Change some columns to text */
ALTER TABLE inventario.estacoes_analise ALTER COLUMN nitratos TYPE text;
COMMENT ON COLUMN inventario.estacoes_analise.nitratos IS 'Nitratos (mg/l)';

ALTER TABLE inventario.estacoes_analise ALTER COLUMN nitritos TYPE text;
COMMENT ON COLUMN inventario.estacoes_analise.nitritos IS 'Nitritos (mg/l)';

ALTER TABLE inventario.estacoes_analise ALTER COLUMN coli_feca TYPE text;
COMMENT ON COLUMN inventario.estacoes_analise.coli_feca IS 'Col. fec. (NMP/100ml):';

ALTER TABLE inventario.estacoes_analise ALTER COLUMN coli_tot TYPE text;
COMMENT ON COLUMN inventario.estacoes_analise.coli_tot IS 'Coli. t (NMP/100ml):';

ALTER TABLE inventario.estacoes_analise ALTER COLUMN amonio TYPE text;
COMMENT ON COLUMN inventario.estacoes_analise.amonio IS 'Amoniaco';


COMMIT;
