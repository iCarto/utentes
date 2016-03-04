-- Deploy create_table_domains_energia_tipo
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.energia_tipo (
    category text,
    key text,
    value text,
    ordering text,
    parent text,
    tooltip text
);

ALTER TABLE domains.energia_tipo OWNER TO utentes;

COMMIT;
