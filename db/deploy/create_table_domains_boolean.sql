-- Deploy create_table_domains_boolean
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.boolean (
    category text,
    key text,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

-- ALTER TABLE domains.boolean OWNER TO utentes;

COMMIT;
