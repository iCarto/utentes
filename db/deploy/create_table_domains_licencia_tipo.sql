-- Deploy create_table_domains_licencia_tipo
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.licencia_tipo (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

-- ALTER TABLE domains.licencia_tipo OWNER TO utentes;

COMMIT;
