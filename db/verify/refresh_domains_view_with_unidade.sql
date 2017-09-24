-- Verify utentes:refresh_domains_view_with_unidade on pg

BEGIN;

SELECT 1/count(*) FROM domains.domains WHERE category = 'unidade';

ROLLBACK;
