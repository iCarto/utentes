-- Revert utentes:new_version_210825 from pg

BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('210607');
INSERT INTO inventario.version (version) VALUES ('210607');

COMMIT;
