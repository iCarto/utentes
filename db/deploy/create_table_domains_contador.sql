-- Deploy create_table_domains_contador
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.contador (
    category text,
    key text,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

-- ALTER TABLE domains.contador OWNER TO utentes;

COMMIT;
