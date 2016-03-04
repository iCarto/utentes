-- Deploy create_table_domains_provincia
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.provincia (
    category text,
    key text UNIQUE,
    value text,
    ordering text,
    parent text,
    tooltip text
);

ALTER TABLE domains.provincia OWNER TO utentes;

COMMIT;
