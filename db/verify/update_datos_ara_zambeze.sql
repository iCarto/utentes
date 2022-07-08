-- Verify utentes:update_datos_ara_zambeze on pg

BEGIN;

SELECT 1/COUNT(*) from utentes.datos_aras WHERE nuit != '' AND name='Administração Regional de Águas do Zambeze';
SELECT 1/COUNT(*) from utentes.datos_aras WHERE conta_bancaria->'iban' != '""' OR conta_bancaria->'n_conta' != '""' OR conta_bancaria->'iban' != '""' AND name = 'Administração Regional de Águas do Zambeze';
SELECT 1/COUNT(*) from utentes.datos_aras WHERE outros->'visao' != '""' AND name = 'Administração Regional de Águas do Zambeze';
SELECT 1/COUNT(*) from utentes.datos_aras WHERE unidades!= '[]' AND name = 'Administração Regional de Águas do Zambeze';

ROLLBACK;
