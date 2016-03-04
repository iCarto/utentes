-- Deploy create_table_domains_licencia_estado
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.licencia_estado (
    category text,
    key text UNIQUE,
    value text,
    ordering text,
    parent text,
    tooltip text
);

ALTER TABLE domains.licencia_estado OWNER TO utentes;

COMMIT;
