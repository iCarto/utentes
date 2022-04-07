-- Revert utentes:enable_extension_unaccent from pg

BEGIN;

DROP EXTENSION unaccent;

COMMIT;
