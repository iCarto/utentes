-- Verify utentes:modify_ara_domain_and_code_validations on pg

BEGIN;

SELECT 'utentes.before_exploracao()'::regprocedure;
SELECT has_function_privilege(:'base_user', 'utentes.before_exploracao()', 'execute');

ROLLBACK;
