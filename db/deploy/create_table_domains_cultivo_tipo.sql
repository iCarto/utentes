-- Deploy create_table_domains_cultivo_tipo
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.cultivo_tipo (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

ALTER TABLE domains.cultivo_tipo OWNER TO utentes;

COMMIT;
