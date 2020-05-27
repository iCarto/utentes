-- Revert utentes:new_version_200527 from pg

BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('191107');
INSERT INTO inventario.version (version) VALUES ('191107');

COMMIT;
