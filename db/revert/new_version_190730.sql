-- Revert utentes:new_version_190730 from pg

BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('190528');
INSERT INTO inventario.version (version) VALUES ('190528');

COMMIT;
