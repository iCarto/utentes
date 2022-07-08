-- Revert utentes:create_view_domains from pg

BEGIN;

DROP VIEW domains.domains;

COMMIT;
