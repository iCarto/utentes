-- Revert utentes:create_new_user_can_not_edit_anything from pg

BEGIN;

DELETE FROM utentes.users WHERE username = 'observador';
DELETE FROM domains.groups WHERE key = 'Observador';

COMMIT;
