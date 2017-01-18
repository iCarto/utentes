-- Deploy utentes:update_domains_pagamentos_renames_keys to pg

BEGIN;

UPDATE domains.pagamentos SET key = 'Paga' WHERE key = 'Pagada';
UPDATE domains.pagamentos SET key = 'Não Paga' WHERE key = 'Non pagada';

COMMIT;
