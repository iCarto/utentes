-- Revert utentes:fill_cbase_ara_schema_from_cbase_schema from pg

BEGIN;

-- Take care. This is not a real rollback. As this schema is done with generated
-- data from schema cbase to make a real rollback, this tables should be
-- restored from a backup or fill again cbase with the previous data and execute
-- again the deploy script

DELETE FROM cbase_ara.entidades_populacao;
DELETE FROM cbase_ara.postos;
DELETE FROM cbase_ara.oceanos;
DELETE FROM cbase_ara.provincias;
DELETE FROM cbase_ara.estradas;
DELETE FROM cbase_ara.lagos;
DELETE FROM cbase_ara.aras;
DELETE FROM cbase_ara.batimetria;
DELETE FROM cbase_ara.rios;
DELETE FROM cbase_ara.bacias_representacion;
DELETE FROM cbase_ara.albufeiras;
DELETE FROM cbase_ara.bacias;
DELETE FROM cbase_ara.distritos;
DELETE FROM cbase_ara.paises_limitrofes;
DELETE FROM cbase_ara.provincias_outras;
DELETE FROM cbase_ara.unidades;

COMMIT;
