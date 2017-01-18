-- Revert utentes:insert_domains_industria_tipo_more_types from pg

BEGIN;

DELETE FROM domains.industria_tipo WHERE key = 'Constructora';
DELETE FROM domains.industria_tipo WHERE key = 'Embotelladora';
DELETE FROM domains.industria_tipo WHERE key = 'Revendedora de água';

COMMIT;
