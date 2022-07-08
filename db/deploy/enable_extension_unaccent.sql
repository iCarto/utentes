-- Deploy utentes:enable_extension_unaccent to pg

BEGIN;

CREATE EXTENSION unaccent;

COMMIT;
