-- Revert utentes:delete_bacia_namacurra_dgblic from pg

BEGIN;

INSERT INTO domains.bacia (key, parent, app) VALUES ('Namacurra', 'DGBLIC', '{Norte}');

REFRESH MATERIALIZED VIEW domains.domains;


COMMIT;
