-- Deploy utentes:new_version_220311 to pg

BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('220311');
INSERT INTO inventario.version (version) VALUES ('220311');

COMMIT;
