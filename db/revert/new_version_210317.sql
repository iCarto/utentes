-- Revert utentes:new_version_210317 from pg

BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('200527');
INSERT INTO inventario.version (version) VALUES ('200527');

COMMIT;
