-- Deploy utentes:create_table_domains_ara to pg

BEGIN;

CREATE TABLE domains.ara (
    category text,
    key text UNIQUE,
    value text,
    ordering integer,
    parent text,
    tooltip text
);

-- ALTER TABLE domains.provincia OWNER TO utentes;

INSERT INTO domains.ara VALUES ('ara', 'Norte', 'Norte', NULL, NULL, NULL);

COMMIT;
