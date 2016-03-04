-- Deploy create_table_domains_fonte_tipo
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.fonte_tipo (
    category text,
    key text,
    value text,
    ordering text,
    parent text,
    tooltip text,
    UNIQUE (key, parent)
);

ALTER TABLE domains.fonte_tipo OWNER TO utentes;

COMMIT;
