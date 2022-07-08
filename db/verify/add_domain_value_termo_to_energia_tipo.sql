-- Verify utentes:add_domain_value_termo_to_energia_tipo on pg

BEGIN;

SELECT 1/(count(*) - 1) FROM domains.energia_tipo WHERE key IS NULL GROUP BY key;

SELECT 1/count(*) FROM domains.energia_tipo WHERE key = 'Termoeléctrica';


ROLLBACK;
