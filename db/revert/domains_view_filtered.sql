-- Revert utentes:domains_view_filtered from pg

BEGIN;

DROP MATERIALIZED VIEW domains.domains;

COMMIT;
