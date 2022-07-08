-- Revert utentes:new_version_210607 from pg

BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('210317');
INSERT INTO inventario.version (version) VALUES ('210317');

COMMIT;
