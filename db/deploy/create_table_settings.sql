-- Deploy create_table_settings

BEGIN;

CREATE TABLE utentes.settings (
    property text PRIMARY KEY,
    value text NOT NULL
);

ALTER TABLE utentes.settings OWNER TO utentes;

COMMIT;
