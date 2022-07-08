-- Deploy create_table_domains_bacia
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.bacia (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

-- ALTER TABLE domains.bacia OWNER TO utentes;

COMMIT;
