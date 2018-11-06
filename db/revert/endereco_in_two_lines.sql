-- Revert utentes:endereco_in_two_lines from pg

BEGIN;

UPDATE utentes.datos_aras SET endereco = null;

ALTER TABLE utentes.datos_aras ALTER COLUMN endereco TYPE TEXT;


UPDATE utentes.datos_aras SET endereco = 'Av. Samora Machel nº 30 7º andar. 4033, 1º Bairro Fiscal, Cidade de Maputo, Moçambique.' WHERE name = 'Administração Regional de Águas do Sul';
UPDATE utentes.datos_aras SET endereco = 'Rúa, nº: Avda. Josina Machel nº 583, Bairro de Natite, Cidade de Pemba, Moçambique.' WHERE name = 'Administração Regional de Águas do Norte';
UPDATE utentes.datos_aras SET endereco = 'Bairro Mpadue EN, nº 07, C.P. 67, Cidade de Tete, Moçambique.' WHERE name = 'Administração Regional de Águas do Zambeze';







COMMIT;
