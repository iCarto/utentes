-- Revert utentes:update_domains_actividade_renames_regadio from pg

BEGIN;

UPDATE domains.actividade SET key='Agricultura-Regadia' WHERE key = 'Agricultura de Regadio';

COMMIT;
