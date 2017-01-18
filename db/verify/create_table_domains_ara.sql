-- Verify utentes:create_table_domains_ara on pg

BEGIN;

SELECT category, key, value, ordering, tooltip, parent FROM domains.ara WHERE false;

ROLLBACK;
