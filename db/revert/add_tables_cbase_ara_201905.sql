-- Revert utentes:changes_in_cbase_for_creating_elle_maps from pg

BEGIN;


DROP TABLE cbase_ara.aras;
DROP TABLE cbase_ara.bacias;
DROP TABLE cbase_ara.albufeiras;
DROP TABLE cbase_ara.lagos;
DROP TABLE cbase_ara.rios;
DROP TABLE cbase_ara.entidades_populacao;
DROP TABLE cbase_ara.estradas;
DROP TABLE cbase_ara.paises_limitrofes;
DROP TABLE cbase_ara.oceanos;
DROP TABLE cbase_ara.batimetria;
DROP TABLE cbase_ara.provincias;
DROP TABLE cbase_ara.provincias_outras;
DROP TABLE cbase_ara.distritos;
DROP TABLE cbase_ara.postos;
DROP SCHEMA cbase_ara;
DROP TABLE cbase.bacias_represenacion;

COMMIT;
