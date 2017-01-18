-- Deploy utentes:update_domains_actividade_renames_regadio to pg

BEGIN;

UPDATE domains.actividade SET key='Agricultura de Regadio' WHERE key = 'Agricultura-Regadia';

COMMIT;
