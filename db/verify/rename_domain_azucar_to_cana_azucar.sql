-- Verify utentes:rename_domain_azucar_to_cana_azucar on pg

BEGIN;

SELECT 1/(count(*) - 1) FROM domains.cultivo_tipo WHERE key IS NULL GROUP BY key;
SELECT 1/count(*) FROM domains.cultivo_tipo WHERE key = 'Outras';
SELECT 1/count(*) FROM domains.cultivo_tipo WHERE key = 'Cana-de-açúcar';


ROLLBACK;
