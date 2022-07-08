-- Verify utentes:create_view_domains on pg

BEGIN;

SELECT category, key, value, ordering, parent, tooltip FROM domains.domains WHERE false;

ROLLBACK;
