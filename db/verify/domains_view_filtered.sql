-- Verify utentes:domains_view_filtered on pg

BEGIN;

SELECT * FROM domains.domains WHERE FALSE;

ROLLBACK;
