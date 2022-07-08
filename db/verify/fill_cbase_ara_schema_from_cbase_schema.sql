-- Verify utentes:fill_cbase_ara_schema_from_cbase_schema on pg

BEGIN;

SELECT 1/count(*) FROM cbase_ara.entidades_populacao;
SELECT 1/count(*) FROM cbase_ara.postos;
SELECT 1/count(*) FROM cbase_ara.oceanos;
SELECT 1/count(*) FROM cbase_ara.provincias;
SELECT 1/count(*) FROM cbase_ara.estradas;
SELECT 1/count(*) FROM cbase_ara.lagos;
SELECT 1/count(*) FROM cbase_ara.aras;
SELECT 1/count(*) FROM cbase_ara.batimetria;
SELECT 1/count(*) FROM cbase_ara.rios;
SELECT 1/count(*) FROM cbase_ara.bacias_representacion;
SELECT 1/count(*) FROM cbase_ara.albufeiras;
SELECT 1/count(*) FROM cbase_ara.bacias;
SELECT 1/count(*) FROM cbase_ara.distritos;
SELECT 1/count(*) FROM cbase_ara.paises_limitrofes;
SELECT 1/count(*) FROM cbase_ara.provincias_outras;

-- No hay para Zamebeze
-- SELECT 1/count(*) FROM cbase_ara.unidades;

ROLLBACK;
