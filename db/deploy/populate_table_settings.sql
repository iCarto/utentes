-- Deploy utentes:populate_table_settings to pg

BEGIN;

INSERT INTO utentes.settings (property, value) VALUES ('docPath', '');

COMMIT;
