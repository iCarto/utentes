-- Deploy utentes:changes_in_departaments_perms_and_names to pg

BEGIN;

ALTER TABLE utentes.documentos ADD CONSTRAINT documentos_departamento_fkey FOREIGN KEY (departamento) REFERENCES domains.groups(key) ON UPDATE CASCADE ON DELETE NO ACTION;

-- Si bien tiene sentido meter esta fkey tenemos un problema con SINGLE_USER que no está en la tabla
-- Y también habría que pensar que hacer para gestionar a futuro que pasa cuando se borra un usuario.
ALTER TABLE utentes.documentos DROP CONSTRAINT documentos_user_fkey;

ALTER TABLE utentes.users DROP CONSTRAINT users_usergroup_fkey;
ALTER TABLE utentes.users ADD CONSTRAINT users_usergroup_fkey FOREIGN KEY (usergroup) REFERENCES domains.groups(key) ON UPDATE CASCADE ON DELETE NO ACTION;

-- UPDATE domains.groups SET (key, value) = ('', '') WHERE key = 'Administrador';
UPDATE domains.groups SET (key, value) = ('Departamento Administrativo', 'DA') WHERE key = 'D. Administrativo';
UPDATE domains.groups SET (key, value) = ('Direcção', 'Direcção') WHERE key = 'Direcção';
UPDATE domains.groups SET (key, value) = ('Departamento Financeiro', 'DF') WHERE key = 'D. Financeiro';
UPDATE domains.groups SET (key, value) = ('Departamento Jurídico', 'DJ') WHERE key = 'D. Jurídico';
UPDATE domains.groups SET (key, value) = ('Departamento Técnico', '') WHERE key = 'D. Técnico';

COMMIT;
