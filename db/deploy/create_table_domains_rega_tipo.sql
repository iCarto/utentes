-- Deploy create_table_domains_rega_tipo
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.rega_tipo (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

-- ALTER TABLE domains.rega_tipo OWNER TO utentes;

COMMIT;
