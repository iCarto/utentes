-- Verify utentes:create_user_for_unidades_and_delegaciones on pg

BEGIN;

SELECT 1/count(*) FROM domains.groups WHERE key = 'Unidade ou Delegação';

ROLLBACK;
