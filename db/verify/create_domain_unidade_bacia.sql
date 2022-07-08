-- Verify utentes:create_domain_unidade_bacia on pg

BEGIN;

SELECT * FROM domains.unidade WHERE FALSE;

ROLLBACK;
