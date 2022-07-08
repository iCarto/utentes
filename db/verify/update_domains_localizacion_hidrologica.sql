-- Verify utentes:update_domains_localizacion_hidrologica on pg

BEGIN;

SELECT ara FROM domains.bacia;
SELECT ara FROM domains.subacia;

ROLLBACK;
