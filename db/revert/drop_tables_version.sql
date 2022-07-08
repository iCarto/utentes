-- Revert utentes:drop_tables_version from pg

BEGIN;

BEGIN;

CREATE TABLE utentes.version (
    version text primary key
);

CREATE TABLE inventario.version (
    version text primary key
);

INSERT INTO utentes.version VALUES ('220502');
INSERT INTO inventario.version VALUES ('220502');

COMMIT;
