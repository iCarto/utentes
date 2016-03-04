-- Deploy create_table_domains_subacia
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.subacia (
    category text,
    key text,
    value text,
    ordering text,
    parent text,
    tooltip text,
    UNIQUE (key, parent)
);

ALTER TABLE domains.subacia OWNER TO utentes;

COMMIT;
