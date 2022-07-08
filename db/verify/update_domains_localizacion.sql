-- Verify utentes:update_domains_localizacion on pg

BEGIN;

SELECT ara FROM domains.provincia;
SELECT ara FROM domains.distrito;
SELECT ara FROM domains.posto;

ROLLBACK;
