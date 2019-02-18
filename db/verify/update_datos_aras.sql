-- Verify utentes:update_datos_aras on pg

BEGIN;

SELECT 1/count(*) FROM domains.datos_aras WHERE id = 'ARAN' AND endereco = '{"Avda. Josina Machel nº 583,","Bairro de Natite, Cidade de Pemba, Moçambique"}';

ROLLBACK;
