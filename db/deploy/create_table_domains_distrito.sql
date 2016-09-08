-- Deploy create_table_domains_distrito
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.distrito (
    category text,
    key text,
    value text,
    ordering integer,
    parent text,
    tooltip text,
    UNIQUE (key, parent)
);


-- ALTER TABLE domains.distrito OWNER TO utentes;

COMMIT;
