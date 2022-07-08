-- Verify utentes:modify_domain_hidroelectrica on pg

BEGIN;

SELECT 1/count(*) FROM domains.energia_tipo WHERE key = 'Hidroeléctrica';

ROLLBACK;
