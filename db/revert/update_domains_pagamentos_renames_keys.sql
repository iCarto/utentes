-- Revert utentes:update_domains_pagamentos_renames_keys from pg

BEGIN;

UPDATE domains.pagamentos SET key = 'Pagada' WHERE key = 'Paga';
UPDATE domains.pagamentos SET key = 'Non pagada' WHERE key = 'Não Paga';

COMMIT;
