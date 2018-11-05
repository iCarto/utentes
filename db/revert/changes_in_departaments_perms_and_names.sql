-- Revert utentes:changes_in_departaments_perms_and_names from pg

BEGIN;

-- Si bien tiene sentido meter esta fkey tenemos un problema con SINGLE_USER que no está en la tabla
-- Y también habría que pensar que hacer para gestionar a futuro que pasa cuando se borra un usuario.
ALTER TABLE utentes.documentos ADD CONSTRAINT documentos_user_fkey FOREIGN KEY (user) REFERENCES utentes.users(username) ON UPDATE CASCADE ON DELETE NO ACTION;

ALTER TABLE utentes.documentos DROP CONSTRAINT documentos_departamento_fkey;
UPDATE domains.groups SET (key, value) = ('D. Administrativo', null) WHERE key = 'Departamento Administrativo';
UPDATE domains.groups SET (key, value) = ('Direcção', null) WHERE key = 'Direcção';
UPDATE domains.groups SET (key, value) = ('D. Financeiro', null) WHERE key = 'Departamento Financeiro';
UPDATE domains.groups SET (key, value) = ('D. Jurídico', null) WHERE key = 'Departamento Jurídico';
UPDATE domains.groups SET (key, value) = ('D. Técnico', null) WHERE key = 'Departamento Técnico';

-- DROP SCHEMA users;

COMMIT;
