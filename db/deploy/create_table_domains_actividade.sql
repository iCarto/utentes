-- Deploy create_table_domains_actividade
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.actividade (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

-- ALTER TABLE domains.actividade OWNER TO utentes;

COMMIT;
