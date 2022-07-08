-- Revert utentes:populate_table_settings from pg

BEGIN;

DELETE FROM utentes.settings;

COMMIT;
