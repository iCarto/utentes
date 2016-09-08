-- Deploy create_table_domains_pagamentos
-- requires: create_schema_domains

BEGIN;

CREATE TABLE domains.pagamentos (
    category text,
    key text,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

-- ALTER TABLE domains.pagamentos OWNER TO utentes;

COMMIT;
