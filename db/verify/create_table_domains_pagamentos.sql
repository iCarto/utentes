-- Verify create_table_domains_pagamentos

BEGIN;

SELECT category, key, value, ordering, parent, tooltip
FROM domains.pagamentos
WHERE FALSE;

ROLLBACK;
