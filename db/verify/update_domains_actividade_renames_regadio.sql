-- Verify utentes:update_domains_actividade_renames_regadio on pg

BEGIN;

SELECT 1/count(*) FROM domains.actividade WHERE key = 'Agricultura de Regadio';

ROLLBACK;
