-- Deploy utentes:new_version_191107 to pg

BEGIN;

DELETE FROM utentes.version;
DELETE FROM inventario.version;

INSERT INTO utentes.version (version) VALUES ('191107');
INSERT INTO inventario.version (version) VALUES ('191107');

COMMIT;
