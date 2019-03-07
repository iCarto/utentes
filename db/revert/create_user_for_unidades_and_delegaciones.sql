-- Revert utentes:create_user_for_unidades_and_delegaciones from pg

BEGIN;

DELETE FROM utentes.documentos WHERE departamento = 'Unidade ou Delegação';
DELETE FROM utentes.users WHERE usergroup = 'Unidade ou Delegação';
DELETE FROM domains.groups WHERE key = 'Unidade ou Delegação';

COMMIT;
