-- Deploy utentes:delete_bacia_namacurra_dgblic to pg

BEGIN;

DELETE FROM domains.bacia  WHERE key = 'Namacurra' AND parent = 'DGBLIC';

REFRESH MATERIALIZED VIEW domains.domains;

COMMIT;
