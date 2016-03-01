-- Deploy create_table_domains

BEGIN;

CREATE TABLE utentes.domains (
    gid      serial PRIMARY KEY,
    category text NOT NULL,
    value    text NOT NULL,
    alias    text,
    ordering text,
    parent   text,
    tooltip  text
);

ALTER TABLE utentes.domains OWNER TO utentes;

COMMIT;
