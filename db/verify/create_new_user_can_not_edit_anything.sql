-- Verify utentes:create_new_user_can_not_edit_anything on pg

BEGIN;

SELECT 1/count(*) FROM domains.groups WHERE key = 'Observador';

ROLLBACK;
