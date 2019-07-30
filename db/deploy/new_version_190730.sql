-- Deploy utentes:new_version_190730 to pg

BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('190730');
INSERT INTO inventario.version (version) VALUES ('190730');

COMMIT;
