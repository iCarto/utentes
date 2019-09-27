-- Revert utentes:modify_domain_hidroelectrica from pg

BEGIN;

UPDATE domains.energia_tipo SET key = 'Hidroelectrica' WHERE key = 'Hidroeléctrica';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
