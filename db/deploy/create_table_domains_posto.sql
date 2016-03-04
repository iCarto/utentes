-- Deploy create_table_domains_posto
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.posto (
    category text,
    key text,
    value text,
    ordering text,
    parent text,
    tooltip text,
    UNIQUE (key, parent)
);

ALTER TABLE domains.posto OWNER TO utentes;

COMMIT;
