-- Revert utentes:new_version_211011 from pg

BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('210825');
INSERT INTO inventario.version (version) VALUES ('210825');

COMMIT;
