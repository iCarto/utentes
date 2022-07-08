-- Deploy utentes:new_version_211011 to pg

BEGIN;


DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('211011');
INSERT INTO inventario.version (version) VALUES ('211011');

COMMIT;
