-- Revert utentes:update_datos_ara_zambeze from pg

BEGIN;

UPDATE utentes.datos_aras SET nuit = '' WHERE name = 'Administração Regional de Águas do Zambeze';
UPDATE utentes.datos_aras SET conta_bancaria = jsonb_set(conta_bancaria, '{entidade}', '""') WHERE name = 'Administração Regional de Águas do Zambeze';
UPDATE utentes.datos_aras SET conta_bancaria = jsonb_set(conta_bancaria, '{n_conta}', '""') WHERE name = 'Administração Regional de Águas do Zambeze';
UPDATE utentes.datos_aras SET conta_bancaria = jsonb_set(conta_bancaria, '{iban}', '""') WHERE name = 'Administração Regional de Águas do Zambeze';
UPDATE utentes.datos_aras SET outros = jsonb_set(outros, '{visao}', '""') WHERE name = 'Administração Regional de Águas do Zambeze';
UPDATE utentes.datos_aras SET unidades = '[]' WHERE name = 'Administração Regional de Águas do Zambeze';

COMMIT;
