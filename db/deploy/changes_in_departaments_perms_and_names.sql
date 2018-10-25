-- Deploy utentes:changes_in_departaments_perms_and_names to pg

BEGIN;

ALTER TABLE utentes.documentos ADD CONSTRAINT documentos_departamento_fkey FOREIGN KEY (departamento) REFERENCES domains.groups(key) ON UPDATE CASCADE ON DELETE NO ACTION;



ALTER TABLE utentes.users DROP CONSTRAINT users_usergroup_fkey;
ALTER TABLE utentes.users ADD CONSTRAINT users_usergroup_fkey FOREIGN KEY (usergroup) REFERENCES domains.groups(key) ON UPDATE CASCADE ON DELETE NO ACTION;

-- UPDATE domains.groups SET (key, value) = ('', '') WHERE key = 'Administrador';
UPDATE domains.groups SET (key, value) = ('Departamento Administrativo', 'DA') WHERE key = 'D. Administrativo';
UPDATE domains.groups SET (key, value) = ('Direcção', 'Direcção') WHERE key = 'Direcção';
UPDATE domains.groups SET (key, value) = ('Departamento Financeiro', 'DF') WHERE key = 'D. Financeiro';
UPDATE domains.groups SET (key, value) = ('Departamento Jurídico', 'DJ') WHERE key = 'D. Jurídico';
UPDATE domains.groups SET (key, value) = ('Departamento Técnico', '') WHERE key = 'D. Técnico';


-- CREATE SCHEMA users AUTHORIZATION :"owner";
-- REVOKE ALL ON SCHEMA users from PUBLIC;

-- ALTER TABLE utentes.users SET SCHEMA users;
-- ALTER TABLE domains.groups SET SCHEMA users;

COMMIT;
