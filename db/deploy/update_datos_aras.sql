-- Deploy utentes:update_datos_aras to pg

BEGIN;

UPDATE domains.datos_aras SET endereco = '{"Avda. Josina Machel nº 583,","Bairro de Natite, Cidade de Pemba, Moçambique"}' WHERE id = 'ARAN';

COMMIT;
