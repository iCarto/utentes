-- Revert utentes:new_version_220311 from pg


BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('211011');
INSERT INTO inventario.version (version) VALUES ('211011');

COMMIT;
