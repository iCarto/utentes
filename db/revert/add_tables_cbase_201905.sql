-- Revert utentes:add_tables_cbase_201905 from pg

BEGIN;

DROP TABLE cbase.aras;
DROP TABLE cbase.bacias;
DROP TABLE cbase.albufeiras;
DROP TABLE cbase.lagos;
DROP TABLE cbase.rios;
DROP TABLE cbase.entidades_populacao;
DROP TABLE cbase.estradas;
DROP TABLE cbase.paises_limitrofes;
DROP TABLE cbase.oceanos;
DROP TABLE cbase.batimetria;
DROP TABLE cbase.provincias;
DROP TABLE cbase.distritos;
DROP TABLE cbase.postos;

COMMIT;
