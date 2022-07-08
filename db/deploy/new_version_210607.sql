-- Deploy utentes:new_version_210607 to pg

BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('210607');
INSERT INTO inventario.version (version) VALUES ('210607');

COMMIT;
