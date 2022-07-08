-- Revert utentes:update_datos_aras from pg

BEGIN;

UPDATE domains.datos_aras SET endereco = '{"Rúa, nº: Avda. Josina Machel nº 583,","Bairro de Natite, Cidade de Pemba, Moçambique"}' WHERE id = 'ARAN';

COMMIT;
