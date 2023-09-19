-- Deploy utentes:new_version_230919 to pg

BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('230919');
INSERT INTO inventario.version (version) VALUES ('230919');

COMMIT;
