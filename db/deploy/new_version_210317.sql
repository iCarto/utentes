-- Deploy utentes:new_version_210317 to pg

BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('210317');
INSERT INTO inventario.version (version) VALUES ('210317');

COMMIT;
