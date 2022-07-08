-- Verify utentes:insert_domains_industria_tipo_more_types on pg

BEGIN;

SELECT 1/count(*) FROM domains.industria_tipo WHERE key = 'Constructora';
SELECT 1/count(*) FROM domains.industria_tipo WHERE key = 'Embotelladora';
SELECT 1/count(*) FROM domains.industria_tipo WHERE key = 'Revendedora de água';

ROLLBACK;
