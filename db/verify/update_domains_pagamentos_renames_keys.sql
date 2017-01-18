-- Verify utentes:update_domains_pagamentos_renames_keys on pg

BEGIN;

SELECT 1/count(*) FROM domains.pagamentos WHERE key = 'Paga';
SELECT 1/count(*) FROM domains.pagamentos WHERE key = 'Não Paga';

ROLLBACK;
