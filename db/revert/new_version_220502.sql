-- Revert utentes:new_version_220502 from pg

BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('220311');
INSERT INTO inventario.version (version) VALUES ('220311');


COMMIT;
