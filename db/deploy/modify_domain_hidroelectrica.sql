-- Deploy utentes:modify_domain_hidroelectrica to pg

BEGIN;

UPDATE domains.energia_tipo SET key = 'Hidroeléctrica' WHERE key = 'Hidroelectrica';;

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
