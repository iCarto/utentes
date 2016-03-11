-- Deploy create_table_domains_industria_tipo
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.industria_tipo (
    category text,
    key text UNIQUE,
    value text,
    ordering text,
    parent text,
    tooltip text
);

ALTER TABLE domains.industria_tipo OWNER TO utentes;

COMMIT;
