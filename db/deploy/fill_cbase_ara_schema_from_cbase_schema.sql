-- Deploy utentes:fill_cbase_ara_schema_from_cbase_schema to pg

BEGIN;

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


INSERT INTO cbase_ara.aras SELECT * FROM cbase.aras WHERE nome ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.unidades SELECT * FROM cbase.unidades WHERE ara ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.bacias SELECT * FROM cbase.bacias WHERE ara ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.bacias_representacion SELECT * FROM cbase.bacias_representacion WHERE ara ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.albufeiras SELECT * FROM cbase.albufeiras WHERE ara ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.lagos SELECT * FROM cbase.lagos WHERE ara ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.rios SELECT * FROM cbase.rios WHERE ara ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.entidades_populacao SELECT * FROM cbase.entidades_populacao WHERE ara ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.estradas SELECT * FROM cbase.estradas WHERE ara ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.paises_limitrofes SELECT * FROM cbase.paises_limitrofes WHERE ara ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.oceanos SELECT * FROM cbase.oceanos WHERE ara ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.batimetria (profundid, ara, geom) SELECT profundid, ara, ST_Multi((ST_Dump(geom)).geom) FROM cbase.batimetria ;
INSERT INTO cbase_ara.provincias SELECT * FROM cbase.provincias WHERE ara ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.provincias_outras SELECT * FROM cbase.provincias WHERE ara !~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.distritos SELECT * FROM cbase.distritos WHERE ara ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');
INSERT INTO cbase_ara.postos SELECT * FROM cbase.postos WHERE ara ~ ((SELECT tooltip FROM domains.ara LIMIT 1) || '(,|$)');

COMMIT;
